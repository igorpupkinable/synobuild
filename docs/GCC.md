### Compile static library
https://www.youtube.com/watch?v=t5TfYRRHG04
```bash
$ gcc -c addNumbers.c subNumbers.c
$ ar cr lib/libmath.a addNumbers.o subNumbers.o
$ gcc doMath.c -lmath -o doMath -I include/ -L lib/
```

### Compile shared library
https://www.youtube.com/watch?v=mUbWcxSb4fw&t=969s
```bash
$ gcc -fpic -c addNumbers.c subNumbers.c
$ gcc -o libmath.so.1.2.3 addNumbers.o subNumbers.o -fpic -shared -Wl,-soname,libmath.so.1
$ gcc doMath.c -o doMath -lmath -I include/ -L lib/
```
