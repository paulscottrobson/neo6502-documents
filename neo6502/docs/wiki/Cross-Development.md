---
---
# Getting Started in Cross Development

There is a file in the release called *crossdev.zip* which contains a worked example of how to create both graphics and programs, with Windows and Linux support.

# Command Line
The emulator has several options on the command line.

- "cold" boots BASIC in standard mode, avoiding the monitor
- "warm" boots BASIC in warm start mode, anything in memory will be retained.
- "exec" boots BASIC and runs the program in memory.

Program can be loaded into memory using the syntax `<file>@<address in hex>`. That address can be "page" which means
the address BASIC expects to find the code in.
	
So to load and run a program use the following (adjusting for where you put the binaries) :

`../bin/neo  program.bas@page exec`

Or in windows

`..\bin\neo.exe program.bas@page exec`

This performs the following
1. starts the emulator
1. loads the tokenised BASIC program to "page" (changes as BASIC grows)
1. sets it to run 'exec' mode, so it auto runs when it starts.

One can create an example BASIC program from a text equivalent (see the basic/code directory for many examples), this is done
with the makebasic.zip program which requires Python 3

Something like 

`python3 makebasic.zip source.txt -oprogram.bas

this converts the file "source.txt" which is a basic source file in text form, line numbers optional to a tokenised program 
which can be run as above.

