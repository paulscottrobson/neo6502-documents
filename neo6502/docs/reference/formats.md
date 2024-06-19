

# File Formats

There are some standard file extensions - .bsc for Basic source (e.g. text file) .bas for Basic tokenised, .neo for a runnable file, but these are not mandatory

## NEO Load file format

There is an extended file format which allows the loading of multiple files and optional execution. This is as follows

| Offset | Contents | Notes                                                        |
| ------ | -------- | ------------------------------------------------------------ |
| 0      | $03      | Not a valid 65C02 opcode, nor can it be the first byte of a program. |
| 1      | $4E      | ASCII 'N'                                                    |
| 2      | $45      | ASCII 'E'                                                    |
| 3      | $4F      | ASCII 'O'                                                    |
| 4,5    | $00,$00  | Minimum major/minor version required to work.                |
| 6,7    | $FF,$FF  | Execute address. To autorun a BASIC program set to $806      |
| 8      | Control  | Control bits, currently only bit 7 is used, which indicates another block follows this one |
| 9,10   | Load     | Load address (16 bits) $FFFF loads into graphic object memory, $FFFD loads to the BASIC workspace. |
| 11,12  | Size     | Size to load in bytes.                                       |
| 13...  | Comment  | ASCIIZ string which is a comment, filename, whatever         |
| ....   | Data     | The data itself                                              |


The block then repeats from 'Control' as many times as required.


The Python application 'exec.zip' both constructs executable files, or displays them. This has the same execution format as the emulator, as listed below.

python exec.zip -d{file} dumps a file

python exec.zip {command list} -o{outputfile} builds a file

- {file}@page Loads BASIC program
- {file}@ffff Loads Graphics Object file
- {file}@{hex address} Loads arbitrary file
- run@{hex address} Sets the executable address
- exec runs BASIC program

for example, you can build a frogger executable with:

python exec.zip {frogger.bas@page} {frogger.gfx@ffff} exec -ofrogger.neo

Loading a file can be done by calling the kernel function LoadExtended (which does the autorun for you) or using the normal messaging system.

If you handle it yourself bear in mind that on return, it is always possible that the code you write to call the execution routine may already have been overwritten by the loaded file.

