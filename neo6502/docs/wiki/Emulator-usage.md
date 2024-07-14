---
---
# Using the emulator

There are pre-built emulators for Linux (Ubuntu) and Windows in the zip files. The Linux build requires SDL2.

This has been tested and has held up so far. However, there may well be bugs. 

So if you want to type code into the emulator, or the real machine, it's advisable that you save regularly and save to different file names (e.g.  myprog.001 myprog.002 etc.) just in case something goes awry. If it does, please let me know or raise an issue.

## Debugger

The emulator has a simple 65C02 debugger built in. This can be triggered from code using opcode $03, which causes 
a break to debugger. The keys are :

- ESC Exit emulator
- TAB Shows current display when in debug mode- 
- F1 Reset CPU
- F5 Run
- F6 Break into debugger manually
- F7 Step
- F8 Step over
- F9 Set Breakpoint
- 0-9A-F Sets the current code address (with shift pressed sets the current data address)

These keys can be disabled using the command 'keys' in the command line ; in this case Ctrl + ESC is required to exit the program.

## Loading files
This is handled under [[Cross Development]]

## Local files
The emulator does not have an SD Card or USB Key , so it simulates this with a directory called 'storage' which will be in the same directory as the one from where you run the emulator.

Files such as graphics files should be stored here.

## Emulator Command Line options

The following are available as command line options :+1: 

**(filename)@(address)** loads a file to a given address in hexadecimal (e.g. code.bin@2000). The address FFFF is used to load a file into the graphics memory space if required

**(filename)@page** loads a file at PAGE, which is the address where BASIC code is loaded (e.g. program.bas@page)

**cold warm exec** are used to run BASIC as Cold Start, Warm Start, or running the loaded program, and set the reset vector to $800, $803 and $806 respectively before the initial processor reset

**run@(address)** sets the reset vector to an arbitrary address (so run@803 is the same as 'warm')

**path:(path)** sets the path where files are stored

**keys** disables the debugger keys

**(filename).neo** loads and runs a .neo file

**scale=n** sets the emulator display scale from 1-4
