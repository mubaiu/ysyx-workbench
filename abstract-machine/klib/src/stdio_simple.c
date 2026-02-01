#include <am.h>
#include <klib.h>
#include <klib-macros.h>
#include <stdarg.h>

#if !defined(__ISA_NATIVE__) || defined(__NATIVE_USE_KLIB__)

// 简化版printf - 只支持基本格式
int printf(const char *fmt, ...) {
  char buf[256];
  va_list args;
  va_start(args, fmt);

  int len = vsprintf(buf, fmt, args);

  for (int i = 0; buf[i] != '\0'; i++) {
    putch(buf[i]);
  }

  va_end(args);
  return len;
}

// 简化版vsprintf - 只支持 %s, %d, %c, %%
int vsprintf(char *out, const char *fmt, va_list ap) {
  int outindex = 0;
  int fmtindex = 0;

  while (fmt[fmtindex] != '\0') {
    if (fmt[fmtindex] != '%') {
      out[outindex++] = fmt[fmtindex++];
      continue;
    }

    fmtindex++; // 跳过 '%'

    switch (fmt[fmtindex]) {
      case 'd': {
        // 有符号整数
        int num = va_arg(ap, int);
        char temp[16];
        int temp_idx = 0;

        if (num < 0) {
          out[outindex++] = '-';
          num = -num;
        }

        if (num == 0) {
          out[outindex++] = '0';
        } else {
          while (num > 0) {
            temp[temp_idx++] = (num % 10) + '0';
            num /= 10;
          }
          while (temp_idx > 0) {
            out[outindex++] = temp[--temp_idx];
          }
        }
        break;
      }

      case 's': {
        // 字符串
        char *str = va_arg(ap, char*);
        if (!str) str = "(null)";
        while (*str) {
          out[outindex++] = *str++;
        }
        break;
      }

      case 'c': {
        // 字符
        char c = (char)va_arg(ap, int);
        out[outindex++] = c;
        break;
      }

      case '%': {
        // 百分号
        out[outindex++] = '%';
        break;
      }

      default:
        // 未知格式符
        out[outindex++] = '%';
        out[outindex++] = fmt[fmtindex];
    }

    fmtindex++;
  }

  out[outindex] = '\0';
  return outindex;
}

int sprintf(char *out, const char *fmt, ...) {
  va_list args;
  va_start(args, fmt);
  int ret = vsprintf(out, fmt, args);
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

int vsnprintf(char *out, size_t n, const char *fmt, va_list ap) {
  if (n == 0) return 0;
  if (n == 1) {
    out[0] = '\0';
    return 0;
  }

  int outindex = 0;
  int fmtindex = 0;

  while (fmt[fmtindex] != '\0' && outindex < n - 1) {
    if (fmt[fmtindex] != '%') {
      out[outindex++] = fmt[fmtindex++];
      continue;
    }

    fmtindex++;

    switch (fmt[fmtindex]) {
      case 'd': {
        int num = va_arg(ap, int);
        char temp[16];
        int temp_idx = 0;

        if (num < 0 && outindex < n - 1) {
          out[outindex++] = '-';
          num = -num;
        }

        if (num == 0) {
          if (outindex < n - 1) out[outindex++] = '0';
        } else {
          while (num > 0) {
            temp[temp_idx++] = (num % 10) + '0';
            num /= 10;
          }
          while (temp_idx > 0 && outindex < n - 1) {
            out[outindex++] = temp[--temp_idx];
          }
        }
        break;
      }

      case 's': {
        char *str = va_arg(ap, char*);
        if (!str) str = "(null)";
        while (*str && outindex < n - 1) {
          out[outindex++] = *str++;
        }
        break;
      }

      case 'c': {
        char c = (char)va_arg(ap, int);
        if (outindex < n - 1) out[outindex++] = c;
        break;
      }

      case '%': {
        if (outindex < n - 1) out[outindex++] = '%';
        break;
      }

      default:
        if (outindex < n - 1) out[outindex++] = '%';
        if (outindex < n - 1) out[outindex++] = fmt[fmtindex];
    }

    fmtindex++;
  }

  out[outindex] = '\0';
  return outindex;
}

#endif
