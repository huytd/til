# Debug C/C++ application with LLDB

Let's take this sample application:

```c
int main() {
  *((unsigned int*)0) = 0xDEADBEEF;
  return 0;
}
```

If you compile and run this program, it will crash. If you use `lldb` to debug, you will only get this output:

```
Process 13904 launched: '/Users/huy/code/play/crash' (x86_64)
Process 13904 stopped
* thread #1: tid = 0x3c81f, 0x0000000100000fa1 crash`main + 17, queue = 'com.apple.main-thread', stop reason = EXC_BAD_ACCESS (code=1, address=0x0)
    frame #0: 0x0000000100000fa1 crash`main + 17
crash`main:
->  0x100000fa1 <+17>: movl   $0xdeadbeef, (%rdx)       ; imm = 0xDEADBEEF
    0x100000fa7 <+23>: popq   %rbp
    0x100000fa8 <+24>: retq
    0x100000fa9:       nop
(lldb)
```

If you're like me, not familiar with ASM, you will only see a bunk of mysterious memory addresses combined with some ASM code. No idea how to debug it.

We need to tell the `gcc` compiler to generate a `dSYM` package contains all the debug information for the app with `-g` parameter:

```
gcc crash.c -g -o crash
```

The output should have:

```
|-- crash
|-- crash.dSYM
```

Now start `lldb` and attach the debugger with your application:

```
lldb crash
```

The `lldb` will attach to your application. Now you need to run it:

```
(lldb) run
```

Then, voilà! It's crashed! And `lldb` show us some code!

```
(lldb) run
Process 13829 launched: '/Users/huy/code/play/crash' (x86_64)
Process 13829 stopped
* thread #1: tid = 0x3c2c4, 0x0000000100000fa1 crash`main + 17 at crash.c:2, queue = 'com.apple.main-thread', stop reason = EXC_BAD_ACCESS (code=1, address=0x0)
    frame #0: 0x0000000100000fa1 crash`main + 17 at crash.c:2
   1   	int main() {
-> 2   	  *((unsigned int*)0) = 0xDEADBEEF;
   3   	  return 0;
   4   	}
(lldb)
```

It must be easier to debug now.
