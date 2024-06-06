---
---
# Using LLVM-Mos

With the new version of llvm-mos, which natively supports neo6502, you can compile your C source code (even written for the CC65 compiler) without modifying the code. Pay attention to the warnings; llvm-mos is much stricter than CC65.

Download here: https://github.com/llvm-mos/llvm-mos-sdk/
Compile the source following the instruction inside the page

You will find useful files in the directory: 
```
$(LLVM_MOS_SDK)/bin/mos-neo6502-clang
```

If you're starting from scratch, you can use the high-level functions for writing to the API mailbox. See the directory:
```
$(LLVM_MOS_SDK)/mos-platform/neo6502/include
```

Here's an example of the command to compile the code:
```
$(LLVM_MOS_SDK)/bin/mos-neo6502-clang  main.c -o main.neo
```

If you use the -Os option, which allows you to have optimized code, remember that the variables with which you call the library should be of type "volatile." Don't make the same mistake as I did. If you use the LLVM_MOS high-level functions don't worry about this.
And here's an example of the command to compile the optimized code:
```
$(LLVM_MOS_SDK)/bin/mos-neo6502-clang  -Os main.c -o main.neo
```

If you're using VSCode to write the code, add the directory $(LLVM_MOS_SDK)/mos-platform/neo6502/include to the IncludePath variable.

In the directory, you can find an example of using the API mailbox functions:
```
$(LLVM_MOS_SDK)/examples/neo6502
```
