
#include <stdio.h>
#include <string.h>

extern "C"
{
    extern void fortran_print(char *line);

    void c_print(const char *line)
    {
        printf("C code: string=%s length=%i\n", line, strlen(line));
        fortran_print("pong");
    }
}
