#include <xc.h>
extern unsigned int mysqrt(unsigned int a);

void main(void) {
    volatile unsigned int result = mysqrt(10);
    while(1);
    return;
}
