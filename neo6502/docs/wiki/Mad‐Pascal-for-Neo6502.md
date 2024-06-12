---
---
# Using Mad Pascal

[Mad-Pascal](https://github.com/tebe6502/Mad-Pascal/releases) is a highly optimized and continuously developed cross-compiler for the Pascal language for the [6502](https://en.wikipedia.org/wiki/MOS_Technology_6502) family of processors. Initially created for the Atari platform, it has since been adapted for several other target platforms, including neo6502.

Compilation to machine code is a two-step process. In the first step, the code is compiled to assembler source code compatible with the [MADS](https://github.com/tebe6502/Mad-Assembler/releases) assembler, and then the code is assembled into an executable machine code file.

The following guide will help you set up a complete development environment, tailored for quick and convenient coding on the neo6502 on your PC. We will also write our first program together, compile it, and run it in an emulator.

## Installing the Emulator

The first thing we will need is the latest version of the neo6502 emulator so that we can test our software on a development machine. Download it from the project's official GitHub: [https://github.com/paulscottrobson/neo6502-firmware/releases](https://github.com/paulscottrobson/neo6502-firmware/releases)

All we need for now is the emulator executable. It is located in the root directory of the downloaded archive and is simply named `neo` (`neo.exe` for Windows). Let's place it in an easily accessible directory. For the purposes of our guide, let it be the following directory:

| Windows | Linux  |
| -- | -- |
| `d:/neo6502/neo.exe` | `~/neo6502/neo` |


Note that the downloaded archive also contains a `documents` directory, which includes a detailed description of the API functions provided by the firmware of our device. It will certainly come in handy during our adventures with programming on the neo6502, so it's worth keeping it nearby.

## Downloading and Compiling the Assembler and Mad-Pascal Compiler

I recommend always using the latest version of the MADS assembler and Mad-Pascal compiler, which we will compile from the sources in a moment. For this purpose, we will need the [git](https://git-scm.com/downloads) tool and the free [FreePascal](https://www.freepascal.org/) compiler. Both tools should be downloaded from the above links and installed.

Now, using git, we will download the latest versions of the assembler and compiler and then compile them.

#### Windows
Open a console (cmd), navigate to the directory where you want to install the compilers (in our example `D:`), and then execute the following commands:
```
git clone https://github.com/tebe6502/Mad-Assembler.git
cd Mad-Assembler
fpc -Mdelphi -vh -O3 mads.pas
cd ..
git clone https://github.com/tebe6502/Mad-Pascal.git
cd Mad-Pascal/src
fpc -Mdelphi -vh -O3 mp.pas
copy mp.exe ..
```
#### Linux
In the directory where you want to install the compilers (in our example in the home directory `~`), enter the following console commands:
```
git clone https://github.com/tebe6502/Mad-Assembler.git
cd Mad-Assembler
fpc -Mdelphi -vh -O3 mads.pas
cd ..
git clone https://github.com/tebe6502/Mad-Pascal.git
cd Mad-Pascal/src
fpc -Mdelphi -vh -O3 mp.pas
cp mp ..
```
Be careful because the **-O3** parameter is an uppercase "o", not a zero.
## Writing Our First Program

Now let's write our first Pascal program and save it in the project directory as `hello.pas`:
```Pascal
program hello;
begin
  Writeln('Hello neo6502!');
end.
```
Let's try to compile it manually:

| Windows | Linux  |
| -- | -- |
| `D:\Mad-Pascal\mp.exe hello.pas -target:neo -code:5000` | `~\Mad-Pascal\mp hello.pas -target:neo -code:5000` |


The `-code:5000` option will cause our program code to be compiled at address $5000 (20480). This is an example value; you can compile the code to any location, just remember not to overwrite areas used by the firmware (you can find the memory map in the emulator archive in the `documents\basic.pdf` directory).
As a result of the compilation, an intermediate assembler file `hello.a65` will be created in the project directory. In the next step, we will assemble this program into machine code, i.e., the target executable file.

| Windows | Linux  |
| -- | -- |
| `D:\Mad-Assembler\mads.exe hello.a65 -x -i:D:\Mad-Pascal\base -o:hello.bin` | `~\Mad-Assembler\mads hello.a65 -x -i:~\Mad-Pascal\base -o:hello.bin` |


The **-x** option causes potentially unused procedures to be removed during the assembly process, which is beneficial for us as the resulting file will be smaller. The path after the **-i** parameter indicates the directory with the base Mad-Pascal libraries, and the **-o** parameter allows you to specify the name of the output file, which should appear in the project directory after the assembly.

Let's try to run it in the emulator.

| Windows | Linux  |
| -- | -- |
| `D:\neo6502\neo.exe hello.bin@5000 run@5000` | `~\neo6502\neo hello.bin@5000 run@5000` |


Hooray! We have successfully written our first program in Mad-Pascal for neo6502!
Notice that in the emulator call, we need to specify the compilation and run address consistent with the one provided during the initial compilation.

Entering all these commands each time would be terribly inconvenient and time-consuming, so we will automate this process for our convenience and save time.

## Preparing Batch Files for Source Compilation
In the directory of our first project, let's prepare a batch file that will do the hard work for us and carry out the process of compiling and running any Pascal file.

#### Windows
Let's create a batch file `build.bat`
```batch
@setlocal
@SET MPPATH=D:\Mad-Pascal
@SET MADSPATH=D:\Mad-Assembler
@SET NEOPATH=D:\neo6502
@SET ORG=5000
@SET NAME=%1

%MPPATH%\mp.exe %NAME%.pas -target:neo -code:%ORG%
@if %ERRORLEVEL% == 0 %MADSPATH%\mads.exe %NAME%.a65 -x -i:%MPPATH%\base -o:%NAME%.bin
@if %ERRORLEVEL% == 0 %NEOPATH%\neo.exe %NAME%.bin@%ORG% run@%ORG%
```

#### Linux
Let's create a batch file `build.sh`
```bash
#!/usr/bin/bash
MPPATH=~/Mad-Pascal
MADSPATH=~/Mad-Assembler
NEOPATH=~/neo6502
ORG=5000
NAME=${1}

$MPPATH/mp ${NAME}.pas -target:neo -code:${ORG} && \
$MADSPATH/mads ${NAME}.a65 -x -i:${MPPATH}/base -o:${NAME}.bin && \
$NEOPATH/neo ${NAME}.bin@${ORG} run@${ORG}
```
In the Linux system, the `build.sh` file must have execution rights:
```
chmod +x build.sh
```
Let's try to compile and run our first program using the batch file.

| Windows | Linux  |
| -- | -- |
| `build.bat hello`  | `./build.sh hello`  |


And if everything went well, you should see the compilation process in the console window, and then the emulator window with our first program running.
If something went wrong, make sure you have the correct paths in the batch file.

Of course, you can modify and customize this batch file as you see fit, or write it completely differently. This is just an example that I hope will encourage you to experiment with Mad-Pascal.

## Libraries for neo6502
The bare "naked" Mad-Pascal will allow us to write simple programs in text mode, but to fully exploit its capabilities on the neo6502, several additional libraries have been created. They help in communication with the device's firmware and provide full support for color graphics, sprites, tile maps, controllers, and all functions provided by the system's API.

These libraries are available to you without any additional steps as they are already part of the Mad-Pascal compiler distribution.

| Library Name | Description  |
| :- | :- |
| [NEO6502](https://bocianu.gitlab.io/neo-mplibs/neo6502.html) | Main API function library for Neo6502  |
| [NEO6502KEYS](https://bocianu.gitlab.io/neo-mplibs/neo6502keys.html) | Library for reading keyboard state using HID codes. |
| [NEO6502MATH](https://bocianu.gitlab.io/neo-mplibs/neo6502math.html) | Library for accelerating mathematical calculations and some other operations |
| [NEO6502UEXT](https://bocianu.gitlab.io/neo-mplibs/neo6502uext.html) | Input/output interface function library for UEXT |


Link to full documentation: [https://bocianu.gitlab.io/neo-mplibs/](https://bocianu.gitlab.io/neo-mplibs/)

To use these libraries, simply add their names in the `uses` clause.

```pascal
program api;
uses neo6502, crt;
begin
  ClrScr;
  NeoBeep;
  NeoCredits;
  repeat until KeyPressed;
end.
```

## Sample Programs
More sample programs utilizing specific neo6502 functions can be found in the Mad-Pascal directory in the `Mad-Pascal\samples\neo6502\` subfolder. These are good examples to start with and to begin your adventure with this compiler.

And if you'd like to look at the source code of larger projects in Mad-Pascal, check out [bocianu's GitLab](https://gitlab.com/bocianu), who has written several games and tools for the neo6502.