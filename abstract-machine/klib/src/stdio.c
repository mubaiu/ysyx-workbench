#include <am.h>
#include <klib.h>
#include <klib-macros.h>
#include <stdarg.h>


#if !defined(__ISA_NATIVE__) || defined(__NATIVE_USE_KLIB__)





// int putchar(int c) {
//   putch((char)c);
//   return c & 0xff;  // 返回写入的字符
// }




int printf(const char *fmt, ...) {
  char buf[4096]; // 定义一个足够大的缓冲区
  va_list args;
  va_start(args, fmt);
  
  // 使用 vsnprintf 将格式化字符串写入缓冲区，限制最大长度
  int len = vsnprintf(buf, sizeof(buf), fmt, args);
  
  // 逐个字符输出到标准输出
  for (int i = 0; buf[i] != '\0'; i++) {
    putch(buf[i]);
  }
  
  va_end(args);
  return len;
}

int vsprintf(char *out, const char *fmt, va_list ap) {
  int outindex = 0;
  int fmtindex = 0;
  
  while (fmt[fmtindex] != '\0') {
    // 普通字符直接复制
    if (fmt[fmtindex] != '%') {
      out[outindex++] = fmt[fmtindex++];
      continue;
    }
    
    // 处理格式化标记
    fmtindex++; // 跳过 '%'
    
    // 解析标志位
    int flag_left_align = 0;   // '-' 左对齐
    int flag_plus = 0;         // '+' 总是显示符号
    int flag_space = 0;        // ' ' 正数前加空格
    int flag_hash = 0;         // '#' 特定格式使用
    int flag_zero_padding = 0; // '0' 零填充
    
    int parsing_flags = 1;
    while (parsing_flags) {
      switch (fmt[fmtindex]) {
        case '-': flag_left_align = 1; fmtindex++; break;
        case '+': flag_plus = 1; fmtindex++; break;
        case ' ': flag_space = 1; fmtindex++; break;
        case '#': flag_hash = 1; fmtindex++; break;
        case '0': flag_zero_padding = 1; fmtindex++; break;
        default: parsing_flags = 0; break;
      }
    }
    
    // 解析宽度
    int width = 0;
    if (fmt[fmtindex] == '*') {
      width = va_arg(ap, int);
      if (width < 0) {
        flag_left_align = 1;
        width = -width;
      }
      fmtindex++;
    } else {
      while (fmt[fmtindex] >= '0' && fmt[fmtindex] <= '9') {
        width = width * 10 + (fmt[fmtindex] - '0');
        fmtindex++;
      }
    }
    
    // 解析精度
    int precision = -1;
    if (fmt[fmtindex] == '.') {
      fmtindex++;
      precision = 0;
      if (fmt[fmtindex] == '*') {
        precision = va_arg(ap, int);
        precision = (precision < 0) ? -1 : precision;
        fmtindex++;
      } else {
        while (fmt[fmtindex] >= '0' && fmt[fmtindex] <= '9') {
          precision = precision * 10 + (fmt[fmtindex] - '0');
          fmtindex++;
        }
      }
    }
    
    // 解析长度修饰符
    int length_modifier = 0; // 0=默认, 1=h, 2=hh, 3=l, 4=ll, 5=z
    if (fmt[fmtindex] == 'h') {
      fmtindex++;
      length_modifier = 1;
      if (fmt[fmtindex] == 'h') {
        fmtindex++;
        length_modifier = 2;
      }
    } else if (fmt[fmtindex] == 'l') {
      fmtindex++;
      length_modifier = 3;
      if (fmt[fmtindex] == 'l') {
        fmtindex++;
        length_modifier = 4;
      }
    } else if (fmt[fmtindex] == 'z') {
      fmtindex++;
      length_modifier = 5;
    }
    
    // 临时缓冲区用于格式化数字
    char temp_buffer[64];
    int temp_index = 0;
    
    // 根据格式符类型处理
    switch (fmt[fmtindex]) {
      case 'd':
      case 'i': {
        // 获取有符号整数
        long long num;
        if (length_modifier == 1) num = (short)va_arg(ap, int);
        else if (length_modifier == 2) num = (char)va_arg(ap, int);
        else if (length_modifier == 3) num = va_arg(ap, long);
        else if (length_modifier == 4) num = va_arg(ap, long long);
        else num = va_arg(ap, int);
        
        // 处理符号
        int is_negative = 0;
        if (num < 0) {
          is_negative = 1;
          num = -num;
        }
        
        // 处理0值的特殊情况
        if (num == 0 && precision != 0) {
          temp_buffer[temp_index++] = '0';
        } else {
          // 转换为字符串（反序）
          while (num > 0) {
            temp_buffer[temp_index++] = (num % 10) + '0';
            num /= 10;
          }
        }
        
        // 处理精度 (添加前导0)
        int digits = temp_index;
        while (digits < precision) {
          temp_buffer[temp_index++] = '0';
          digits++;
        }
        
        // 添加符号
        if (is_negative) {
          temp_buffer[temp_index++] = '-';
        } else if (flag_plus) {
          temp_buffer[temp_index++] = '+';
        } else if (flag_space) {
          temp_buffer[temp_index++] = ' ';
        }
        
        // 计算填充字符数量
        int padding = width - temp_index;
        
        // 输出结果（考虑对齐）
        if (!flag_left_align) {
          // 右对齐
          char pad_char = (flag_zero_padding && precision < 0) ? '0' : ' ';
          while (padding-- > 0) {
            out[outindex++] = pad_char;
          }
        }
        
        // 反向输出格式化后的数字
        while (temp_index > 0) {
          out[outindex++] = temp_buffer[--temp_index];
        }
        
        // 左对齐时添加右侧填充
        if (flag_left_align) {
          while (padding-- > 0) {
            out[outindex++] = ' ';
          }
        }
        break;
      }
      
      case 'u': {
        // 获取无符号整数
        unsigned long long num;
        if (length_modifier == 1) num = (unsigned short)va_arg(ap, unsigned int);
        else if (length_modifier == 2) num = (unsigned char)va_arg(ap, unsigned int);
        else if (length_modifier == 3) num = va_arg(ap, unsigned long);
        else if (length_modifier == 4) num = va_arg(ap, unsigned long long);
        else num = va_arg(ap, unsigned int);
        
        // 处理0值的特殊情况
        if (num == 0 && precision != 0) {
          temp_buffer[temp_index++] = '0';
        } else {
          // 转换为字符串（反序）
          while (num > 0) {
            temp_buffer[temp_index++] = (num % 10) + '0';
            num /= 10;
          }
        }
        
        // 处理精度 (添加前导0)
        int digits = temp_index;
        while (digits < precision) {
          temp_buffer[temp_index++] = '0';
          digits++;
        }
        
        // 计算填充字符数量
        int padding = width - temp_index;
        
        // 输出结果（考虑对齐）
        if (!flag_left_align) {
          // 右对齐
          char pad_char = (flag_zero_padding && precision < 0) ? '0' : ' ';
          while (padding-- > 0) {
            out[outindex++] = pad_char;
          }
        }
        
        // 反向输出格式化后的数字
        while (temp_index > 0) {
          out[outindex++] = temp_buffer[--temp_index];
        }
        
        // 左对齐时添加右侧填充
        if (flag_left_align) {
          while (padding-- > 0) {
            out[outindex++] = ' ';
          }
        }
        break;
      }
      
      case 'x':
      case 'X': {
        // 获取无符号整数
        unsigned long long num;
        if (length_modifier == 1) num = (unsigned short)va_arg(ap, unsigned int);
        else if (length_modifier == 2) num = (unsigned char)va_arg(ap, unsigned int);
        else if (length_modifier == 3) num = va_arg(ap, unsigned long);
        else if (length_modifier == 4) num = va_arg(ap, unsigned long long);
        else num = va_arg(ap, unsigned int);
        
        // 确定使用的字符集 (大写或小写)
        const char *hex_chars = (fmt[fmtindex] == 'x') ? "0123456789abcdef" : "0123456789ABCDEF";
        
        // 处理0值的特殊情况
        if (num == 0 && precision != 0) {
          temp_buffer[temp_index++] = '0';
        } else {
          // 转换为十六进制字符串（反序）
          while (num > 0) {
            temp_buffer[temp_index++] = hex_chars[num & 0xF];
            num >>= 4;
          }
        }
        
        // 处理精度 (添加前导0)
        int digits = temp_index;
        while (digits < precision) {
          temp_buffer[temp_index++] = '0';
          digits++;
        }
        
        // 添加0x/0X前缀
        if (flag_hash && temp_index > 0 && temp_buffer[0] != '0') {
          char prefix_char = (fmt[fmtindex] == 'x') ? 'x' : 'X';
          temp_buffer[temp_index++] = prefix_char;
          temp_buffer[temp_index++] = '0';
        }
        
        // 计算填充字符数量
        int padding = width - temp_index;
        
        // 输出结果（考虑对齐）
        if (!flag_left_align) {
          // 右对齐
          char pad_char = (flag_zero_padding && precision < 0) ? '0' : ' ';
          while (padding-- > 0) {
            out[outindex++] = pad_char;
          }
        }
        
        // 反向输出格式化后的数字
        while (temp_index > 0) {
          out[outindex++] = temp_buffer[--temp_index];
        }
        
        // 左对齐时添加右侧填充
        if (flag_left_align) {
          while (padding-- > 0) {
            out[outindex++] = ' ';
          }
        }
        break;
      }
      
      case 'p': {
        // 指针格式化为十六进制
        void *ptr = va_arg(ap, void *);
        uintptr_t num = (uintptr_t)ptr;
        
        if (num == 0) {
          // 空指针特殊处理为"(nil)"
          const char *nil_str = "(nil)";
          int nil_len = 0;
          while (nil_str[nil_len]) nil_len++;
          
          for (int i = 0; i < nil_len; i++) {
            out[outindex++] = nil_str[i];
          }
        } else {
          // 添加0x前缀
          temp_buffer[temp_index++] = 'x';
          temp_buffer[temp_index++] = '0';
          
          // 特殊情况：num为0
          if (num == 0) {
            temp_buffer[temp_index++] = '0';
          } else {
            // 转换为十六进制字符串（反序）
            while (num > 0) {
              temp_buffer[temp_index++] = "0123456789abcdef"[num & 0xF];
              num >>= 4;
            }
          }
          
          // 计算填充字符数量
          int padding = width - temp_index;
          
          // 输出结果（考虑对齐）
          if (!flag_left_align) {
            while (padding-- > 0) {
              out[outindex++] = ' ';
            }
          }
          
          // 反向输出格式化后的指针
          while (temp_index > 0) {
            out[outindex++] = temp_buffer[--temp_index];
          }
          
          // 左对齐时添加右侧填充
          if (flag_left_align) {
            while (padding-- > 0) {
              out[outindex++] = ' ';
            }
          }
        }
        break;
      }
      
      case 's': {
        char *str = va_arg(ap, char*);
        if (!str) str = "(null)";
        
        // 计算字符串长度（考虑精度限制）
        int len = 0;
        while (str[len] && (precision < 0 || len < precision)) {
          len++;
        }
        
        // 计算填充字符数量
        int padding = width - len;
        
        // 输出结果（考虑对齐）
        if (!flag_left_align) {
          while (padding-- > 0) {
            out[outindex++] = ' ';
          }
        }
        
        // 输出字符串内容
        for (int i = 0; i < len; i++) {
          out[outindex++] = str[i];
        }
        
        // 左对齐时添加右侧填充
        if (flag_left_align) {
          while (padding-- > 0) {
            out[outindex++] = ' ';
          }
        }
        break;
      }
      
      case 'c': {
        char c = (char)va_arg(ap, int);
        
        // 计算填充字符数量
        int padding = width - 1;
        
        // 输出结果（考虑对齐）
        if (!flag_left_align) {
          while (padding-- > 0) {
            out[outindex++] = ' ';
          }
        }
        
        // 输出字符
        out[outindex++] = c;
        
        // 左对齐时添加右侧填充
        if (flag_left_align) {
          while (padding-- > 0) {
            out[outindex++] = ' ';
          }
        }
        break;
      }
      
      case '%': {
        // 百分号本身
        out[outindex++] = '%';
        break;
      }
      
      default:
        // 未知格式符，原样输出
        out[outindex++] = '%';
        out[outindex++] = fmt[fmtindex];
    }
    
    fmtindex++; // 移至下一字符
  }
  
  out[outindex] = '\0';
  return outindex;
}

int sprintf(char *out, const char *fmt, ...) {
  va_list args;
  va_start(args, fmt);
  
  // 使用 vsnprintf 并传递一个足够大的大小值
  // SIZE_MAX 在大多数系统上是 size_t 能表示的最大值
  int ret = vsnprintf(out, (size_t)-1, fmt, args);
  
  va_end(args);
  return ret;
}

int snprintf(char *out, size_t n, const char *fmt, ...) {
  va_list args;
  va_start(args, fmt);
  int ret = vsnprintf(out, n, fmt, args);
  va_end(args);
  return ret;
}

// ...existing code...
int vsnprintf(char *out, size_t n, const char *fmt, va_list ap) {
  if (n == 0) return 0;
  if (n == 1) {
    out[0] = '\0';
    return 0;
  }
  
  int outindex = 0;
  int fmtindex = 0;
  int total_chars = 0; // 记录实际需要输出的字符数（不考虑缓冲区大小限制）
  
  while (fmt[fmtindex] != '\0') {
    // 普通字符直接复制
    if (fmt[fmtindex] != '%') {
      total_chars++;
      if (outindex < n - 1) {
        out[outindex++] = fmt[fmtindex];
      }
      fmtindex++;
      continue;
    }
    
    // 处理格式化标记
    fmtindex++; // 跳过 '%'
    
    // 解析标志位
    int flag_left_align = 0;   // '-' 左对齐
    int flag_plus = 0;         // '+' 总是显示符号
    int flag_space = 0;        // ' ' 正数前加空格
    int flag_hash = 0;         // '#' 特定格式使用
    int flag_zero_padding = 0; // '0' 零填充
    
    int parsing_flags = 1;
    while (parsing_flags) {
      switch (fmt[fmtindex]) {
        case '-': flag_left_align = 1; fmtindex++; break;
        case '+': flag_plus = 1; fmtindex++; break;
        case ' ': flag_space = 1; fmtindex++; break;
        case '#': flag_hash = 1; fmtindex++; break;
        case '0': flag_zero_padding = 1; fmtindex++; break;
        default: parsing_flags = 0; break;
      }
    }
    
    // 解析宽度
    int width = 0;
    if (fmt[fmtindex] == '*') {
      width = va_arg(ap, int);
      if (width < 0) {
        flag_left_align = 1;
        width = -width;
      }
      fmtindex++;
    } else {
      while (fmt[fmtindex] >= '0' && fmt[fmtindex] <= '9') {
        width = width * 10 + (fmt[fmtindex] - '0');
        fmtindex++;
      }
    }
    
    // 解析精度
    int precision = -1;
    if (fmt[fmtindex] == '.') {
      fmtindex++;
      precision = 0;
      if (fmt[fmtindex] == '*') {
        precision = va_arg(ap, int);
        precision = (precision < 0) ? -1 : precision;
        fmtindex++;
      } else {
        while (fmt[fmtindex] >= '0' && fmt[fmtindex] <= '9') {
          precision = precision * 10 + (fmt[fmtindex] - '0');
          fmtindex++;
        }
      }
    }
    
    // 解析长度修饰符
    int length_modifier = 0; // 0=默认, 1=h, 2=hh, 3=l, 4=ll, 5=z
    if (fmt[fmtindex] == 'h') {
      fmtindex++;
      length_modifier = 1;
      if (fmt[fmtindex] == 'h') {
        fmtindex++;
        length_modifier = 2;
      }
    } else if (fmt[fmtindex] == 'l') {
      fmtindex++;
      length_modifier = 3;
      if (fmt[fmtindex] == 'l') {
        fmtindex++;
        length_modifier = 4;
      }
    } else if (fmt[fmtindex] == 'z') {
      fmtindex++;
      length_modifier = 5;
    }
    
    // 临时缓冲区用于格式化数字
    char temp_buffer[64];
    int temp_index = 0;
    
    // 根据格式符类型处理
    switch (fmt[fmtindex]) {
      case 'd':
      case 'i': {
        // 获取有符号整数
        long long num;
        if (length_modifier == 1) num = (short)va_arg(ap, int);
        else if (length_modifier == 2) num = (char)va_arg(ap, int);
        else if (length_modifier == 3) num = va_arg(ap, long);
        else if (length_modifier == 4) num = va_arg(ap, long long);
        else num = va_arg(ap, int);
        
        // 处理符号
        int is_negative = 0;
        if (num < 0) {
          is_negative = 1;
          num = -num;
        }
        
        // 处理0值的特殊情况
        if (num == 0 && precision != 0) {
          temp_buffer[temp_index++] = '0';
        } else {
          // 转换为字符串（反序）
          while (num > 0) {
            temp_buffer[temp_index++] = (num % 10) + '0';
            num /= 10;
          }
        }
        
        // 处理精度 (添加前导0)
        int digits = temp_index;
        while (digits < precision) {
          temp_buffer[temp_index++] = '0';
          digits++;
        }
        
        // 添加符号
        if (is_negative) {
          temp_buffer[temp_index++] = '-';
        } else if (flag_plus) {
          temp_buffer[temp_index++] = '+';
        } else if (flag_space) {
          temp_buffer[temp_index++] = ' ';
        }
        
        // 计算填充字符数量
        int padding = width - temp_index;
        
        // 更新总字符计数
        total_chars += (padding > 0) ? temp_index + padding : temp_index;
        
        // 输出结果（考虑对齐）
        if (!flag_left_align) {
          // 右对齐
          char pad_char = (flag_zero_padding && precision < 0) ? '0' : ' ';
          while (padding-- > 0) {
            if (outindex < n - 1) {
              out[outindex++] = pad_char;
            }
          }
        }
        
        // 反向输出格式化后的数字
        while (temp_index > 0) {
          if (outindex < n - 1) {
            out[outindex++] = temp_buffer[--temp_index];
          } else {
            --temp_index;
          }
        }
        
        // 左对齐时添加右侧填充
        if (flag_left_align) {
          while (padding-- > 0) {
            if (outindex < n - 1) {
              out[outindex++] = ' ';
            }
          }
        }
        break;
      }
      
      case 'u': {
        // 获取无符号整数
        unsigned long long num;
        if (length_modifier == 1) num = (unsigned short)va_arg(ap, unsigned int);
        else if (length_modifier == 2) num = (unsigned char)va_arg(ap, unsigned int);
        else if (length_modifier == 3) num = va_arg(ap, unsigned long);
        else if (length_modifier == 4) num = va_arg(ap, unsigned long long);
        else num = va_arg(ap, unsigned int);
        
        // 处理0值的特殊情况
        if (num == 0 && precision != 0) {
          temp_buffer[temp_index++] = '0';
        } else {
          // 转换为字符串（反序）
          while (num > 0) {
            temp_buffer[temp_index++] = (num % 10) + '0';
            num /= 10;
          }
        }
        
        // 处理精度 (添加前导0)
        int digits = temp_index;
        while (digits < precision) {
          temp_buffer[temp_index++] = '0';
          digits++;
        }
        
        // 计算填充字符数量
        int padding = width - temp_index;
        
        // 更新总字符计数
        total_chars += (padding > 0) ? temp_index + padding : temp_index;
        
        // 输出结果（考虑对齐）
        if (!flag_left_align) {
          // 右对齐
          char pad_char = (flag_zero_padding && precision < 0) ? '0' : ' ';
          while (padding-- > 0) {
            if (outindex < n - 1) {
              out[outindex++] = pad_char;
            }
          }
        }
        
        // 反向输出格式化后的数字
        while (temp_index > 0) {
          if (outindex < n - 1) {
            out[outindex++] = temp_buffer[--temp_index];
          } else {
            --temp_index;
          }
        }
        
        // 左对齐时添加右侧填充
        if (flag_left_align) {
          while (padding-- > 0) {
            if (outindex < n - 1) {
              out[outindex++] = ' ';
            }
          }
        }
        break;
      }
      
      case 'x':
      case 'X': {
        // 获取无符号整数
        unsigned long long num;
        if (length_modifier == 1) num = (unsigned short)va_arg(ap, unsigned int);
        else if (length_modifier == 2) num = (unsigned char)va_arg(ap, unsigned int);
        else if (length_modifier == 3) num = va_arg(ap, unsigned long);
        else if (length_modifier == 4) num = va_arg(ap, unsigned long long);
        else num = va_arg(ap, unsigned int);
        
        // 确定使用的字符集 (大写或小写)
        const char *hex_chars = (fmt[fmtindex] == 'x') ? "0123456789abcdef" : "0123456789ABCDEF";
        
        // 处理0值的特殊情况
        if (num == 0 && precision != 0) {
          temp_buffer[temp_index++] = '0';
        } else {
          // 转换为十六进制字符串（反序）
          while (num > 0) {
            temp_buffer[temp_index++] = hex_chars[num & 0xF];
            num >>= 4;
          }
        }
        
        // 处理精度 (添加前导0)
        int digits = temp_index;
        while (digits < precision) {
          temp_buffer[temp_index++] = '0';
          digits++;
        }
        
        // 添加0x/0X前缀
        if (flag_hash && temp_index > 0 && temp_buffer[0] != '0') {
          char prefix_char = (fmt[fmtindex] == 'x') ? 'x' : 'X';
          temp_buffer[temp_index++] = prefix_char;
          temp_buffer[temp_index++] = '0';
        }
        
        // 计算填充字符数量
        int padding = width - temp_index;
        
        // 更新总字符计数
        total_chars += (padding > 0) ? temp_index + padding : temp_index;
        
        // 输出结果（考虑对齐）
        if (!flag_left_align) {
          // 右对齐
          char pad_char = (flag_zero_padding && precision < 0) ? '0' : ' ';
          while (padding-- > 0) {
            if (outindex < n - 1) {
              out[outindex++] = pad_char;
            }
          }
        }
        
        // 反向输出格式化后的数字
        while (temp_index > 0) {
          if (outindex < n - 1) {
            out[outindex++] = temp_buffer[--temp_index];
          } else {
            --temp_index;
          }
        }
        
        // 左对齐时添加右侧填充
        if (flag_left_align) {
          while (padding-- > 0) {
            if (outindex < n - 1) {
              out[outindex++] = ' ';
            }
          }
        }
        break;
      }
      
      case 'p': {
        // 指针格式化为十六进制
        void *ptr = va_arg(ap, void *);
        uintptr_t num = (uintptr_t)ptr;
        
        if (num == 0) {
          // 空指针特殊处理为"(nil)"
          const char *nil_str = "(nil)";
          int nil_len = 0;
          while (nil_str[nil_len]) nil_len++;
          
          total_chars += nil_len;
          
          for (int i = 0; i < nil_len; i++) {
            if (outindex < n - 1) {
              out[outindex++] = nil_str[i];
            }
          }
        } else {
          // 添加0x前缀
          temp_buffer[temp_index++] = 'x';
          temp_buffer[temp_index++] = '0';
          
          // 特殊情况：num为0
          if (num == 0) {
            temp_buffer[temp_index++] = '0';
          } else {
            // 转换为十六进制字符串（反序）
            while (num > 0) {
              temp_buffer[temp_index++] = "0123456789abcdef"[num & 0xF];
              num >>= 4;
            }
          }
          
          // 计算填充字符数量
          int padding = width - temp_index;
          
          // 更新总字符计数
          total_chars += (padding > 0) ? temp_index + padding : temp_index;
          
          // 输出结果（考虑对齐）
          if (!flag_left_align) {
            while (padding-- > 0) {
              if (outindex < n - 1) {
                out[outindex++] = ' ';
              }
            }
          }
          
          // 反向输出格式化后的指针
          while (temp_index > 0) {
            if (outindex < n - 1) {
              out[outindex++] = temp_buffer[--temp_index];
            } else {
              --temp_index;
            }
          }
          
          // 左对齐时添加右侧填充
          if (flag_left_align) {
            while (padding-- > 0) {
              if (outindex < n - 1) {
                out[outindex++] = ' ';
              }
            }
          }
        }
        break;
      }
      
      case 's': {
        char *str = va_arg(ap, char*);
        if (!str) str = "(null)";
        
        // 计算字符串长度（考虑精度限制）
        int len = 0;
        while (str[len] && (precision < 0 || len < precision)) {
          len++;
        }
        
        // 计算填充字符数量
        int padding = width - len;
        
        // 更新总字符计数
        total_chars += (padding > 0) ? len + padding : len;
        
        // 输出结果（考虑对齐）
        if (!flag_left_align) {
          while (padding-- > 0) {
            if (outindex < n - 1) {
              out[outindex++] = ' ';
            }
          }
        }
        
        // 输出字符串内容
        for (int i = 0; i < len; i++) {
          if (outindex < n - 1) {
            out[outindex++] = str[i];
          }
        }
        
        // 左对齐时添加右侧填充
        if (flag_left_align) {
          while (padding-- > 0) {
            if (outindex < n - 1) {
              out[outindex++] = ' ';
            }
          }
        }
        break;
      }
      
      case 'c': {
        char c = (char)va_arg(ap, int);
        
        // 计算填充字符数量
        int padding = width - 1;
        
        // 更新总字符计数
        total_chars += (padding > 0) ? 1 + padding : 1;
        
        // 输出结果（考虑对齐）
        if (!flag_left_align) {
          while (padding-- > 0) {
            if (outindex < n - 1) {
              out[outindex++] = ' ';
            }
          }
        }
        
        // 输出字符
        if (outindex < n - 1) {
          out[outindex++] = c;
        }
        
        // 左对齐时添加右侧填充
        if (flag_left_align) {
          while (padding-- > 0) {
            if (outindex < n - 1) {
              out[outindex++] = ' ';
            }
          }
        }
        break;
      }
      
            // 替换浮点数格式化部分
      
      case 'f':
      case 'F':
      case 'e':
      case 'E':
      case 'g':
      case 'G':
      case 'a':
      case 'A': {
          // 使用union安全地访问浮点数的位表示
          union {
              double d;
              uint32_t u[2]; // double是64位，用两个32位整数表示
          } bits;
          
          // 获取浮点数
          bits.d = va_arg(ap, double);
          
          // 处理符号 (IEEE 754双精度的符号位在高位字的最高位)
          int is_negative = (bits.u[1] >> 31) & 1;
          
          // 提取指数和尾数
          uint32_t exp_bits = ((bits.u[1] >> 20) & 0x7FF);
          uint32_t mantissa_high = (bits.u[1] & 0xFFFFF);
          uint32_t mantissa_low = bits.u[0];
          
          // 特殊值处理
          if (exp_bits == 0x7FF) {
              // 无穷大或NaN
              const char* special_str;
              if ((bits.u[0] == 0) && ((bits.u[1] & 0xFFFFF) == 0)) {
                  // 无穷大
                  special_str = is_negative ? "-inf" : "inf";
              } else {
                  // NaN
                  special_str = "nan";
              }
              
              int special_len = 0;
              while (special_str[special_len]) special_len++;
              
              total_chars += special_len;
              for (int i = 0; i < special_len && outindex < n - 1; i++) {
                  out[outindex++] = special_str[i];
              }
              break;
          }
          
          // 0值的特殊处理
          if (exp_bits == 0 && mantissa_high == 0 && mantissa_low == 0) {
              // 确定要使用的小数位数
              int decimal_places = (precision >= 0) ? precision : 6;
              
              // 计算总长度
              int total_len = 1 + (decimal_places > 0 ? decimal_places + 1 : 0) + (is_negative || flag_plus || flag_space ? 1 : 0);
              
              // 计算填充字符数量
              int padding = width - total_len;
              
              // 更新总字符计数
              total_chars += (padding > 0) ? total_len + padding : total_len;
              
              // 输出结果（考虑对齐）
              if (!flag_left_align) {
                  // 右对齐
                  char pad_char = (flag_zero_padding) ? '0' : ' ';
                  while (padding-- > 0) {
                      if (outindex < n - 1) {
                          out[outindex++] = pad_char;
                      }
                  }
              }
              
              // 输出符号
              if (is_negative) {
                  if (outindex < n - 1) {
                      out[outindex++] = '-';
                  }
              } else if (flag_plus) {
                  if (outindex < n - 1) {
                      out[outindex++] = '+';
                  }
              } else if (flag_space) {
                  if (outindex < n - 1) {
                      out[outindex++] = ' ';
                  }
              }
              
              // 输出0
              if (outindex < n - 1) {
                  out[outindex++] = '0';
              }
              
              // 输出小数部分（如果需要）
              if (decimal_places > 0) {
                  if (outindex < n - 1) {
                      out[outindex++] = '.';
                  }
                  
                  for (int i = 0; i < decimal_places; i++) {
                      if (outindex < n - 1) {
                          out[outindex++] = '0';
                      }
                  }
              }
              
              // 左对齐时添加右侧填充
              if (flag_left_align) {
                  while (padding-- > 0) {
                      if (outindex < n - 1) {
                          out[outindex++] = ' ';
                      }
                  }
              }
              break;
          }
          
          // 确定要使用的小数位数
          int decimal_places = (precision >= 0) ? precision : 6;
          
          // 使用改进的算法处理整数部分和小数部分
          char int_buf[64]; // 存储整数部分
          char frac_buf[64]; // 存储小数部分
          int int_len = 0;
          int frac_len = 0;
          
          // 计算实际值（使用整数算法避免浮点运算）
          int32_t exponent = exp_bits - 1023; // IEEE 754偏移值
          
          // 更精确的整数部分计算
          if (exponent < 0) {
              // 小于1的数
              int_buf[0] = '0';
              int_len = 1;
          } else {
              // 计算整数部分 - 对于52位尾数和合理的指数
              uint64_t int_part = 0;
              
              // 设置隐含的前导1
              uint64_t value = 1ull << 52;
              
              // 添加尾数部分
              value |= ((uint64_t)mantissa_high << 32) | mantissa_low;
              
              // 根据指数调整
              if (exponent > 52) {
                  // 大数处理 - 左移
                  int shift = exponent - 52;
                  if (shift < 64) { // 避免移位过多
                      int_part = value << shift;
                  } else {
                      // 太大的数，简化处理
                      int_buf[int_len++] = '1';
                      for (int i = 0; i < 15; i++) { // 显示15位有效数字
                          int_buf[int_len++] = '0';
                      }
                      goto skip_conversion;
                  }
              } else {
                  // 常规数处理 - 右移
                  int_part = value >> (52 - exponent);
              }
              
              // 转换为十进制字符串
              if (int_part == 0) {
                  int_buf[int_len++] = '0';
              } else {
                  // 使用除法将整数转为字符串
                  uint64_t temp = int_part;
                  while (temp > 0) {
                      int_buf[int_len++] = '0' + (temp % 10);
                      temp /= 10;
                  }
                  
                  // 反转整数部分
                  for (int i = 0, j = int_len - 1; i < j; i++, j--) {
                      char tmp = int_buf[i];
                      int_buf[i] = int_buf[j];
                      int_buf[j] = tmp;
                  }
              }
          }
          
          // 更精确的小数部分计算
          if (decimal_places > 0) {
              if (exponent < 0) {
                  // 小于1的数
                  int abs_exp = -exponent;
                  
                  // 设置隐含的前导1
                  uint64_t frac = 1ull << 52;
                  
                  // 添加尾数部分
                  frac |= ((uint64_t)mantissa_high << 32) | mantissa_low;
                  
                  // 生成小数部分
                  for (int i = 0; i < decimal_places; i++) {
                      // 乘以10并取整数部分
                      frac *= 10;
                      if (abs_exp > 0) {
                          frac >>= 1;
                          abs_exp--;
                      }
                      
                      uint8_t digit = (frac >> 52) & 0xF;
                      frac &= ((1ull << 52) - 1); // 清除整数部分
                      
                      frac_buf[i] = '0' + digit;
                  }
                  frac_len = decimal_places;
              } else if (exponent < 52) {
                  // 有小数部分的常规数
                  uint64_t mask = (1ull << (52 - exponent)) - 1;
                  uint64_t frac = (((uint64_t)mantissa_high << 32) | mantissa_low) & mask;
                  
                  // 设置位的精度
                  uint64_t bit_precision = 1ull << (52 - exponent);
                  
                  // 生成小数部分
                  for (int i = 0; i < decimal_places; i++) {
                      frac *= 10;
                      uint8_t digit = frac / bit_precision;
                      frac %= bit_precision;
                      
                      frac_buf[i] = '0' + digit;
                  }
                  frac_len = decimal_places;
              } else {
                  // 整数，小数部分全为0
                  for (int i = 0; i < decimal_places; i++) {
                      frac_buf[i] = '0';
                  }
                  frac_len = decimal_places;
              }
          }
          
      skip_conversion:
          // 计算总长度
          int total_len = int_len + (decimal_places > 0 ? decimal_places + 1 : 0) + (is_negative || flag_plus || flag_space ? 1 : 0);
          
          // 计算填充字符数量
          int padding = width - total_len;
          
          // 更新总字符计数
          total_chars += (padding > 0) ? total_len + padding : total_len;
          
          // 输出结果（考虑对齐）
          if (!flag_left_align) {
              // 右对齐
              char pad_char = (flag_zero_padding) ? '0' : ' ';
              while (padding-- > 0) {
                  if (outindex < n - 1) {
                      out[outindex++] = pad_char;
                  }
              }
          }
          
          // 输出符号
          if (is_negative) {
              if (outindex < n - 1) {
                  out[outindex++] = '-';
              }
          } else if (flag_plus) {
              if (outindex < n - 1) {
                  out[outindex++] = '+';
              }
          } else if (flag_space) {
              if (outindex < n - 1) {
                  out[outindex++] = ' ';
              }
          }
          
          // 输出整数部分
          for (int i = 0; i < int_len; i++) {
              if (outindex < n - 1) {
                  out[outindex++] = int_buf[i];
              }
          }
          
          // 输出小数部分（如果需要）
          if (decimal_places > 0) {
              if (outindex < n - 1) {
                  out[outindex++] = '.';
              }
              
              for (int i = 0; i < frac_len; i++) {
                  if (outindex < n - 1) {
                      out[outindex++] = frac_buf[i];
                  }
              }
          }
          
          // 左对齐时添加右侧填充
          if (flag_left_align) {
              while (padding-- > 0) {
                  if (outindex < n - 1) {
                      out[outindex++] = ' ';
                  }
              }
          }
          break;
      }
      case '%': {
        // 百分号本身
        total_chars++;
        if (outindex < n - 1) {
          out[outindex++] = '%';
        }
        break;
      }
      
      default:
        // 未知格式符，原样输出
        total_chars += 2;
        if (outindex < n - 1) {
          out[outindex++] = '%';
        }
        if (outindex < n - 1) {
          out[outindex++] = fmt[fmtindex];
        }
    }
    
    fmtindex++; // 移至下一字符
  }
  
  // 确保字符串以 null 结尾
  if (n > 0) {
    out[outindex < (n - 1) ? outindex : (n - 1)] = '\0';
  }
  
  return total_chars;
}
// ...existing code...

#endif