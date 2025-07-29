#include <klib.h>
#include <klib-macros.h>
#include <stdint.h>

#if !defined(__ISA_NATIVE__) || defined(__NATIVE_USE_KLIB__)

size_t strlen(const char *s) {
  const char *p = s;
  while (*p) {
    p++;
  }
  return p - s;
}

char *strcpy(char *dst, const char *src) {
  char *p = dst;
  while ((*p++ = *src++) != '\0') ;
  return dst;
}

char *strncpy(char *dst, const char *src, size_t n) {
  size_t i;
  for (i = 0; i < n && src[i] != '\0'; i++) {
        dst[i] = src[i];
  }
  dst[i] = '\0';
  return dst;
}

char *strcat(char *dst, const char *src) {
  char *p = dst;
  while (*p) {
    p++;
  }
  while ((*p++ = *src++));
  return dst;
}

int strcmp(const char *s1, const char *s2) {
  while (*s1 && (*s1 == *s2)){
    s1++;
    s2++;
  }
  return *(unsigned char *)s1 - *(unsigned char *)s2;
}

int strncmp(const char *s1, const char *s2, size_t n) {
  while (n && *s1 && (*s1 == *s2)){
    s1++;
    s2++;
    n--;
  }
  if (n == 0) {
    return 0;
  }
  return *(unsigned char *)s1 - *(unsigned char *)s2;
}

void *memset(void *s, int c, size_t n) {
  unsigned char *p = s;
  while (n--) {
    *p++ = (unsigned char)c;
  }
  return s;
}

void *memmove(void *dst, const void *src, size_t n) {
  unsigned char *d = dst;
  const unsigned char *s = src;
  if (d == s || n == 0)
    return dst;
  if (d > s && d < s + n) {
    s += n;
    d += n;
    while (n--) {
      *(--d) = *(--s);
    }
  }
  else{
    while (n--)
    {
      *d++ = *s++;
    }
  }
  return dst;
}

void *memcpy(void *out, const void *in, size_t n) {
  unsigned int *p = out;
  const unsigned int *q = in;
  while (n >= 4) {
    *p++ = *q++;
    n -= 4;
  }
  if (n > 0) {
    unsigned char *r = (unsigned char *)p;
    const unsigned char *s = (const unsigned char *)q;
    while (n--) {
      *r++ = *s++;
    }
  }
  return out;
}

int memcmp(const void *s1, const void *s2, size_t n) {
  unsigned char *p1 = (unsigned char *)s1;
  unsigned char *p2 = (unsigned char *)s2;
  for(size_t i = 0; i < n; i++) {
    if (p1[i] != p2[i]) 
      return p1[i] - p2[i];
  }
  return 0;
}

#endif
