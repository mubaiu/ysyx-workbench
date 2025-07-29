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

#include "sdb.h"

#define NR_WP 32

typedef struct watchpoint {
  int NO;
  struct watchpoint *next;
  char *expression;
  int value;
  /* TODO: Add more members if necessary */

} WP;

static WP wp_pool[NR_WP] = {};
static WP *head = NULL, *free_ = NULL;

void init_wp_pool() {
  int i;
  for (i = 0; i < NR_WP; i ++) {
    wp_pool[i].NO = i;
    wp_pool[i].next = (i == NR_WP - 1 ? NULL : &wp_pool[i + 1]);
  }

  head = NULL;
  free_ = wp_pool;
}

WP* new_wp()
{
  if (free_ == NULL) {
    printf("No more free watchpoint!\n");
    assert(0);
  }
  WP *pos = free_;
  free_++;
  pos->next = head;
  head = pos;
  return pos;
}

void free_wp(WP *wp)
{
  if(wp == head)
  {
    head = head->next;
  } 
  else
  {
    WP *pos = head;
    while(pos && pos->next != wp)
    {
      pos++;
    }
    if(!pos)
    {
      printf("Watchpoint not found!\n");
      assert(0);
    }
    pos->next = wp->next;
  }
  free(wp->expression);
  wp->next = free_;
  free_ = wp;
}

void info_watchpoint()
{
  WP *pos = head;
  if(!pos)
  {
    printf("No watchpoint\n");
    return;
  }
  printf("%-8s%-8s\n", "NO", "Expression");
  while(pos){
    printf("%-8d%-8s\n", pos->NO, pos->expression);
    pos = pos->next;
  }
}


void wp_set(char *args, int32_t res)
{
  WP* wp = new_wp();
  wp->expression = (char *)malloc(strlen(args) + 1);
  if (wp->expression == NULL) 
  {
    printf("Memory allocation failed for expression!\n");
    assert(0);
  }
  strcpy(wp->expression, args);
  wp->value = res;
  printf("Watchpoint %d: %s\n", wp->NO, wp->expression);
}

void wp_remove(int no)
{
  if(no < 0 || no >= NR_WP)
  {
    printf("N is not a valid watchpoint number!\n");
    assert(0);
  }
  WP* wp = &wp_pool[no];
  printf("Deleted watchpoint %d: %s\n",wp->NO, wp->expression);
  free_wp(wp);
}

bool wp_check(char *args)
{
  if (strcmp(args, "*0x") == 0) return true;
  return false;
}

void wp_difftest()
{
  WP* pos = head;
  while(pos){
    bool success = true;
    word_t new = expr(pos->expression, &success);
    if (success) {
      if (pos->value != new) {
        if (strcmp(pos->expression, "$pc") == 0){
          printf("Watchpoint %d: %s\n"
                "Old value = %x\n"
                "New value = %x\n", pos->NO, pos->expression, pos->value, new);
                pos->value = new;
                printf("Watchpoint %d triggered!\n", pos->NO);
                nemu_state.state = NEMU_STOP;
        }
        else if (strncmp(pos->expression, "*0x", 3) == 0){
          printf("Watchpoint %d: %s\n"
                "Old value = %x\n"
                "New value = %x\n", pos->NO, pos->expression, pos->value, new);
                pos->value = new;
                printf("Watchpoint %d triggered!\n", pos->NO);
                nemu_state.state = NEMU_STOP;
        }
        else {
          printf("Watchpoint %d: %s\n"
                "Old value = %d\n"
                "New value = %d\n", pos->NO, pos->expression, pos->value, new);
                pos->value = new;
                printf("Watchpoint %d triggered!\n", pos->NO);
                nemu_state.state = NEMU_STOP;
        }
      }
    }
    else {
      printf("Invalid expression: %s\n", pos->expression);
      assert(0);
    }
    pos = pos->next;
  }
}
/* TODO: Implement the functionality of watchpoint */

