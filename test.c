#include <stdio.h>
int main(){
    int a = 0;
    a = ({1+1; 2+2; 3+3;});
    printf("a = %d\n", a);
}