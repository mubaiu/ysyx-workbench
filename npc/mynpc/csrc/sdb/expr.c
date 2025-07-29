/***************************************************************************************
* Copyright (c) 2014-2024 Zihao Yu, Nanjing University
*
* NEMU is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*          http://license.coscl.org.cn/MulanPSL2
*
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
*
* See the Mulan PSL v2 for more details.
***************************************************************************************/

#include <isa.h>
#define MAX_EXPRESSIONS 20000
#define MAX_LENGTH 2560
/* We use the POSIX regex functions to process regular expressions.
 * Type 'man regex' for more information about POSIX regex functions.
 */
#include <regex.h>
word_t paddr_read(paddr_t addr, int len);
enum {
  TK_NOTYPE = 256, TK_EQ, REG, HEX, NUM,
  NEQ, AND, OR, DEREF, NEG, LE_EQ, GR_EQ, PC

  /* TODO: Add more token types */

};

static struct rule {
  const char *regex;
  int token_type;
} rules[] = {

  /* TODO: Add more rules.
   * Pay attention to the precedence level of different rules.
   */

  {" +", TK_NOTYPE},    // spaces

  {"\\+", '+'},         // plus
  {"-", '-'},
  {"\\*", '*'},
  {"\\/", '/'},

  {"==", TK_EQ},        // equal
  {"!=", NEQ},           // not equal
  {"<=", LE_EQ},
  {">=", GR_EQ},

  {"&&",AND},
  {"\\|\\|",OR},
  {"!",'!'}, 

  {"\\(", '('},
  {"\\)", ')'},

  {"\\$pc", PC},
  {"\\$[0-9]|\\$[a-z][a-z0-9]|\\$[a-z][0-9][0-9]", REG},
  {"0[xX][0-9a-fA-F]+", HEX},
  {"[0-9]*", NUM},
};

#define NR_REGEX ARRLEN(rules)

static regex_t re[NR_REGEX] = {};

/* Rules are used for many times.
 * Therefore we compile them only once before any usage.
 */
void init_regex() {
  int i;
  char error_msg[128];
  int ret;

  for (i = 0; i < NR_REGEX; i ++) {
    ret = regcomp(&re[i], rules[i].regex, REG_EXTENDED);
    if (ret != 0) {
      regerror(ret, &re[i], error_msg, 128);
      panic("regex compilation failed: %s\n%s", error_msg, rules[i].regex);
    }
  }
}

typedef struct token {
  int type;
  char str[32];
} Token;

static Token tokens[32] __attribute__((used)) = {};
static int nr_token __attribute__((used))  = 0;

static bool make_token(char *e) {
  int position = 0;
  int i;
  regmatch_t pmatch;

  nr_token = 0;

  while (e[position] != '\0') {
    /* Try all rules one by one. */
    for (i = 0; i < NR_REGEX; i ++) {
      if (regexec(&re[i], e + position, 1, &pmatch, 0) == 0 && pmatch.rm_so == 0) {
        char *substr_start = e + position;
        int substr_len = pmatch.rm_eo;

        Log("match rules[%d] = \"%s\" at position %d with len %d: %.*s",
            i, rules[i].regex, position, substr_len, substr_len, substr_start);

        position += substr_len;

        /* TODO: Now a new token is recognized with rules[i]. Add codes
         * to record the token in the array `tokens'. For certain types
         * of tokens, some extra actions should be performed.
         */

        switch (rules[i].token_type) {
          case TK_NOTYPE: 
              break;
          case '+':
          case '-':
          case '*':
          case '/':
          case TK_EQ:
          case NEQ:
          case LE_EQ:
          case GR_EQ:
          case AND:
          case OR:
          case '!':
          case '(':
          case ')':
          case NUM:
          case HEX:
          case REG:{
            tokens[nr_token].type = rules[i].token_type;
            strncpy(tokens[nr_token].str, substr_start, substr_len);
            strcat(tokens[nr_token].str, "\0");
            nr_token ++;
            break;
          }
          case PC:{
            tokens[nr_token].type = rules[i].token_type;
            nr_token ++;
            break;
          }
          default:
            panic("unknown token type");
        }

        break;
      }
    }

    if (i == NR_REGEX) {
      printf("no match at position %d\n%s\n%*.s^\n", position, e, position, "");
      return false;
    }
  }

  return true;
}

bool check_parenteses(uint32_t p, uint32_t q){
  int flag = 0;
  if(strcmp(tokens[p].str,"(") || strcmp(tokens[q].str,")")) return false;
  p++;
  while(p < q){
    if(strcmp(tokens[p].str,"(") == 0) {
      p++;
      flag++;
    }
    else if(strcmp(tokens[p].str,")") == 0) {
      p++;
      if(--flag < 0)
        return false;
    }
    else
        p++;
  }
  return flag == 0;
}

int priority(int op) {
  if(tokens[op].type == NEG || tokens[op].type == DEREF || strcmp(tokens[op].str, "!") == 0)   return 4;
  else if(strcmp(tokens[op].str, "*") == 0 || strcmp(tokens[op].str, "/") == 0)                return 3;
  else if(strcmp(tokens[op].str, "+") == 0 || strcmp(tokens[op].str, "-") == 0)                return 2;
  else if(tokens[op].type == TK_EQ || tokens[op].type == NEQ || tokens[op].type == LE_EQ || 
    tokens[op].type == GR_EQ || tokens[op].type == AND || tokens[op].type == OR)               return 1;
  else return 10;
}

uint32_t dominant_operator(uint32_t p, uint32_t q){
  // assert(p <= q);
  uint32_t i = q;
  uint32_t op = q-1;
  int pn = 0;
  for (i = q; i > p; i--){
    if(strcmp(tokens[i].str, "(") == 0) pn++;
    if(strcmp(tokens[i].str, ")") == 0) pn--;
    if (pn == 0) 
        if (strcmp(tokens[i].str, "(") != 0 && strcmp(tokens[i].str, ")") != 0 &&
            tokens[i].type != TK_NOTYPE && tokens[i].type != NUM && tokens[i].type != HEX && 
            tokens[i].type != REG && tokens[i].type != PC){
            if(priority(i) < priority(op))
                op = i;
            }
  }
  if(priority(p) < priority(op)) op = p;
  if(priority(op) == 4){
    for(i = op; i > p; i--){
        if(priority(i) == 4)
            op = i;
    }
  }
  return op;
}

int eval(uint32_t p, uint32_t q){
  if(p == q){
    uint32_t value = 0;
    if (tokens[p].type == NUM)
        value = strtoul(tokens[p].str, NULL, 10);

    if (tokens[p].type == HEX)
        value = strtoul(tokens[p].str, NULL, 16);

    if (tokens[p].type == REG){
      int i;
      const char *regs[] = {
        "$0", "$ra", "$sp", "$gp", "$tp", "$t0", "$t1", "$t2",
        "$s0", "$s1", "$a0", "$a1", "$a2", "$a3", "$a4", "$a5",
        "$a6", "$a7", "$s2", "$s3", "$s4", "$s5", "$s6", "$s7",
        "$s8", "$s9", "$s10", "$s11", "$t3", "$t4", "$t5", "$t6"
      };

      for(i = 0; i < 32; i++){
        
        if(strcmp(tokens[p].str, regs[i]) == 0){
            value = npc.gpr[i];
            break;
        }
      }
      if (i == 32)
      {
        panic("unknown register: %s", tokens[p].str);
      }
    }

    if (tokens[p].type == PC){
        char pc_str[1000];
        sprintf(pc_str, "0x%x", npc.pc);
        value = strtoul(pc_str, NULL, 16);
    }

    return value;
  }
  else if (check_parenteses(p, q) == true){
    return eval(p+1, q-1);
  }
  else{
    int op = dominant_operator(p, q);

    int32_t val1 = 0;
    if(tokens[op].type !=DEREF && tokens[op].type != NEG && strcmp(tokens[op].str, "!") != 0)
    {
      if(op>p)
        val1 = eval(p, op-1);
    }
    
    int32_t val2 = eval(op+1, q);

    switch (tokens[op].type){
      case '+': return val1 + val2;
      case '-': return val1 - val2;
      case '*': return val1 * val2;
      case '/': if (val2 == 0) { perror("division by zero");return 0; } else return val1 / val2;
      case TK_EQ: return val1 == val2 ? true : false;
      case NEQ: return val1!= val2 ? true : false;
      case LE_EQ: return val1 <= val2 ? true : false;
      case GR_EQ: return val1 >= val2 ? true : false;
      case AND: return val1 && val2 ? true : false;
      case OR: return val1 || val2 ? true : false;
      case '!': return !val2;
      case DEREF: return paddr_read(val2,4);
      case NEG: return -val2;
      default:
      printf("Error: unknown operator type %d\n", tokens[op].type);
    }
  }
  return 0;
}

word_t expr(char *e, bool *success) {
  if (strcmp(e ,"ext") == 0){
  FILE *file = fopen("/home/mubai/ysyx-workbench/nemu/tools/gen-expr/input", "r");
  if (file == NULL) {
    perror("Error opening file");
    return 1;
  }

  int all = 1;
  char line[MAX_LENGTH];
  int pass = 1;
  int i = 0;
  u_int32_t no[100];
  bool flag = false;

  while (fgets(line, sizeof(line), file) != NULL) {
    line[strcspn(line, "\n")] = '\0';
    
    if (all < MAX_EXPRESSIONS) {
      char expression[1000];
      char *ptr = strchr(line, ' ');
      char part2 [1000];
      char part1 [100];
      char answer[100];

      memset(expression,'\0', sizeof(expression));
      memset(part2,'\0', sizeof(part2));
      memset(part1,'\0', sizeof(part1));
      memset(answer,'\0', sizeof(answer));
      strcpy(part2, ptr+1);
      word_t part1_len = ptr-line;
      strncpy(part1, line, part1_len);
      strcpy(expression, part2);
      strcpy(answer, part1);
      if (!make_token(part2)) {
        *success = false;
        return 0;
      }
      else{
      *success = true;
      uint32_t result = eval(0, nr_token-1);
      printf("No: %d Answer: %s Expression: %s Result: %d\n",all, answer, expression, result);
      all++;
      int answer_t = atoi(answer);
      if (answer_t == result){
        pass++;
      }
      else{
        flag = true;
        no[i] = all;
        i++;
      }
      }
    } 
      else {
        printf("Too many expressions\n");
        break;
      }
  }
  printf("pass: %d all: %d\n", all-1, pass-1);
  if (flag){
    for( ; i>=0 ; i--){
      printf("Incorrect locate: %d\n", no[i]);
    }
  }
  fclose(file);
  }
  else if (!make_token(e)) {
    *success = false;
    return 0;
  }

  /* TODO: Insert codes to evaluate the expression. */
  else
  {
    *success = true;
    int i;
    for (i = 0; i < nr_token; i++) {
      if (tokens[i].type == '*' && (i == 0 || 
        (tokens[i-1].type != NUM && tokens[i-1].type != HEX && tokens[i-1].type != REG && tokens[i-1].type != ')' && tokens[i-1].type != PC))) 
        tokens[i].type = DEREF;
      if (tokens[i].type == '-' && (i == 0 || 
        (tokens[i-1].type != NUM && tokens[i-1].type != HEX && tokens[i-1].type != REG && tokens[i-1].type != ')' && tokens[i-1].type != PC))) 
          tokens[i].type = NEG;
    }
    uint32_t result = eval(0, nr_token-1);
    return result;
  }
  return 0;
}
