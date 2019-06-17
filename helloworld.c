#include <stdio.h>

int main(int argc, char *argv[])
{
    unsigned short addr = 0x0;
    unsigned char  val  = 0x0;

    printf("hello world, this is my first github project!\n");

    /* link: https://www.cnblogs.com/ayanmw/p/3477248.html */
    sscanf("0x0B24, 0xC0", "0x%hx, 0x%hhx", &addr, &val);

    printf("addr = 0x%04x, val = 0x%02x\n", addr, val);

    return 0;
}
