# How to fwrite to removable volume

Given this example file:

    $ cat 'F:\alfa.txt'
    bravo

I can write to the file easily:

~~~c
#include <stdio.h>
int main() {
  FILE* ju = fopen("F:\\alfa.txt", "r+");
  fwrite("Z", 1, 1, ju);
}
~~~

Result:

    $ cat 'F:\alfa.txt'
    Zravo

and I can read from the volume:

~~~c
#include <stdio.h>
int main() {
  char ki[6];
  FILE* ju = fopen("\\\\.\\F:", "r");
  fseek(ju, 0x1004000, SEEK_SET);
  fread(ki, 1, 5, ju);
  puts(ki);
}
~~~

Result:

    $ ./program
    Zravo

However writing to the volume appears to have no effect:

~~~c
#include <stdio.h>
int main() {
  FILE* ju = fopen("\\\\.\\F:", "r+b");
  fseek(ju, 0x1004000, SEEK_SET);
  fwrite("b", 1, 1, ju);
}
~~~

Result:

    $ cat 'F:\alfa.txt'
    Zravo

How can I write to the volume in this manner?

# Answer

You can do this, but some considerations need to be made:

1. Seeking, reading and writing must all be done in multiples of sector size, in
   my case 512 bytes

2. `CreateFile` must be invoked with `dwShareMode` set to 0, to prevent other
   processes from opening the device. Alternatively you can use
   `DeviceIoControl` with `FSCTL_LOCK_VOLUME`

3. I did this with Windows API. Equivalent commands for locking are
   `fcntl(..., F_ETLK, ...)` or `flock(..., LOCK_EX)` or
   `lockf(..., F_LOCK, ...)`, none of which are supported with Windows.
   [A patch][1] was proposed in 2008

Example:

~~~c
#include <windows.h>
#define BYTES_PER_SEC 512
#define DIST_TO_MOVE 0x1004000
int main() {
  DWORD li;
  char ki[BYTES_PER_SEC];
  HANDLE ju = CreateFile("\\\\.\\F:", GENERIC_READ | GENERIC_WRITE, 0, NULL,
    OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
  SetFilePointer(ju, DIST_TO_MOVE, NULL, FILE_BEGIN);
  ReadFile(ju, ki, sizeof ki, &li, NULL);
  ki[0] = 'Z';
  SetFilePointer(ju, DIST_TO_MOVE, NULL, FILE_BEGIN);
  WriteFile(ju, ki, sizeof ki, &li, NULL);
}
~~~

[http only]::
[1]:http://thread.gmane.org/gmane.comp.lib.gnulib.bugs/14975
