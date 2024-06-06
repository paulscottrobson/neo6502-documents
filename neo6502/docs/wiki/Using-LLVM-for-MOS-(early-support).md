---
---
# Using LLVM-Mos
## From 'dertom' in Discord

cc65 with -Osir is not enough?  

You can still try llvm-mos (I'm using this now with my on-and-off neo6502 toy-firmware). It looks quite promising. As a kickstart:

Website: https://llvm-mos.org/wiki/Welcome
Download here:  https://github.com/llvm-mos/llvm-mos-sdk/releases

You need to put an "link.ld"-file along your code. That will tell how to layout the binary. In your case you would have to modify the start-address in userram ORIGIN. 

_Don't know where you start the code. And also have a look at the outputformat. In my case I put the start-address as short value as first value and then the compiled data. If you just want the data remove SHORT(ORIGIN(userram))_

```
MEMORY {
    zp : ORIGIN = __rc31 + 1, LENGTH = 0x100 - (__rc31 + 1)
    ram : ORIGIN = 0x0000, LENGTH = 0x10000 
    user_ram (rw) : ORIGIN = 0x0200, LENGTH = 0xfe00
}

REGION_ALIAS("c_readonly", user_ram)
REGION_ALIAS("c_writeable", user_ram)

SECTIONS { INCLUDE c.ld }

__rc0 = 0x00;
INCLUDE imag-regs.ld
ASSERT(__rc0 == 0x00, "Inconsistent zero page map.")
ASSERT(__rc31 == 0x1f, "Inconsistent zero page map.")

__stack = 0;

OUTPUT_FORMAT { 
    SHORT(ORIGIN(user_ram))
    /*SHORT(__data_end - 0x0200)*/
    TRIM(user_ram)
}
```


Compile like this:
```
$(LLVM_MOS_SDK)/bin/mos-common-clang -D__NG6502  -o ../temp/code.bin -Os -lexit-loop -linit-stack -I.. -I../../source/api main.c 
```

Create a map-file:

```
$(LLVM_MOS_SDK)/bin/llvm-objdump -x ../temp/code.bin.elf > ../temp/code.bin.elf.map
```

I also started with cc65 but c89 made me insane  (Even though there was some c99 compiler-flag that seems to do nothing?) 
Maybe that helps. Actually what I wrote down here is 100% is know.  

