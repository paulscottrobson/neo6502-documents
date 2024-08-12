

# Basic Reference

This is a reference for Neo6502's BASIC interpreter.

There are many example programs available which are designed to show and explain the features of the Neo6502 and its hardware and firmware in the examples directory of the release.

For example if.bsc/if.bas so the options available for the 'if' statement, graphics.bsc/graphics.bas show the drawing commands, and joypad.bsc/joypad.bas show how to access the joypad (or the keyboard backup if none is plugged in)

Many of these are helpful for understanding specific API functions, as many BASIC commands are just wrappers for those functions.


## Binary Operators

| Precedence | Operator | Notes                                                    |
| ---------- | -------- | -------------------------------------------------------- |
| 4          | *        |                                                          |
| 4          | /        | Forward slash is floating point divide. 22/7 is 3.142857 |
| 4          | \        | Backward slash is integer divide, 22\7 is  3             |
| 4          | %        | Modulus of integer division ignoring signs               |
| 4          | >>   | Logical shift right, highest bit zero                    |
| 4          | <<   | Logical shift left                                       |
| 3          | +        |                                                          |
| 3          | -        |                                                          |
| 2          | <      | Return -1 for true,0 for false                           |
| 2          | <=     | Return -1 for true,0 for false                           |
| 2          | >      | Return -1 for true,0 for false                           |
| 2          | >=     | Return -1 for true,0 for false                           |
| 2          | <>   | Return -1 for true,0 for false                           |
| 2          | =        | Return -1 for true,0 for false                           |
| 1          | &        | Binary AND operator on integers                          |
| 1          | \| | Binary OR operator on integers |
| 1          | ^        | Binary XOR operator on integers                          |



## Arithmetic functions

| Operator               | Notes                                                        |
| ---------------------- | ------------------------------------------------------------ |
| alloc(n)               | Allocate n bytes of memory, return address                   |
| analog(n)              | Read voltage level on pin n -- returns a value from 0 to 4095 |
| asc(s$)                | Return ASCII value of first character or zero for empty string |
| atan(n)                | Arctangent of n in degrees                                   |
| atan2(y,x)             | Arctangent 2 calculation, dy / dx => angle                   |
| chr$(n)                | Convert ASCII to string                                      |
| cos(n)                 | Cosine of n, n Is in degrees.                                |
| deek(a)                | Read word value at a                                         |
| eof(f)                 | Returns non-zero value if at end of file f.                  |
| err                    | Current error number                                         |
| erl                    | Current error line number                                    |
| event(v,r)             | event takes an integer variable and a fire rate (r) in 1/100 s, and uses the integer variable to return -1 at that rate. If the value in 'v' is zero, it resets (if you pause say), if the value in v is -1 the timer will not fire -- to unfreeze, set it to zero and it will resynchronise. |
| exists(file$)          | Returns true (-1) if the file exists, false (0) otherwise    |
| exp(n)                 | e to the power n                                             |
| false                  | Return constant 0, improves boolean readability              |
| havemouse()            | Return non zero if a mouse is connected.                     |
| himem                  | First byte after end of memory -- the stack is allocated below here, and string memory below that. |
| inkey$()               | Return the key stroke if one is in the keyboard buffer, otherwise returns a n empty string. |
| idevice(device)        | Returns true if i2c device present.                          |
| iread(device,register) | Read byte from I2C Device Register                           |
| instr(str$,search$)    | Returns the first position of search$ in str$, indexed from 1. Returns zero if not found. |
| int(n)                 | Whole part of the float value n. Integers are unchanged.     |
| isval(s$)              | Converts string to number, returns -1 if okay, 0 if fails.   |
| joycount()             | Read the number of attached joypads, not including keyboard emulation of one. |
| joypad([index],dx,dy)  | Reads the current joypad. The return value has bit 0 set if A is pressed, bit 1 set if B is pressed. Values -1,0 or 1 are placed into dx,dy representing movement on the D-Pad. If there is no gamepad plugged in (at the time of writing it doesn't work) the key equivalents are WASDOP and the cursor keys. If [index] is provided it is a specific joypad (from 1,0 is the keyboard), otherwise it is a composite of all of them. |
| key(n)                 | Return the state of the given key. The key is the USB HID key scan code. |
| left$(a$,n)            | Left most n characters of a$                                 |
| len(a$)                | Return length of string in characters.                       |
| locale a$              | Sets the locale to the 2 character country code a$ e.g. locale "de" |
| log(n)                 | Natural Logarithm (e.g. ln2) of n.                           |
| lower$(a$)             | Convert a string to lower case                               |
| max(a,b)               | Return the largest of a and b (numbers or strings)           |
| mid$(a$,f[,s])         | Characters from a$ starting at f (1 indexed), s characters, s is optional and defaults to the rest of the line. |
| min(a,b)               | Return the smaller of a and b (numbers or strings)           |
| mos(command)           | Like the mos command, but returns an non zero error code if the command caused an error. |
| mouse(x,y[,scroll])    | Reads the mouse. The return value indicates button state (bit 0 left, bit 1 right), and the mouse position and also the scrolling wheel position are updated into the given variables. |
| notes(c)               | Return the number of notes outstanding on channel c including the one currently playing -- so will be zero when the channel goes silent. |
| page                   | Return the address of the program base (e.g. the variable table) |
| peek(a)                | Read byte value at a                                         |
| pin(n)                 | Return value on UEXT pin n if input, output latch value if output. |
| point(x,y)             | Read the screen pixel at coordinates x,y. This is graphics data only. |
| pow(a,b)               | Returns a raised to the power b ; the result is always floating point. |
| rand(n)                | Random integer 0 { x { n (e.g. 0 to n-1)                     |
| right$(a$,n)           | Rightmost n characters of a$                                 |
| rnd(n)                 | Random number 0 { x { 1, ignores n.                          |
| sin(n)                 | Sine of n, n Is in degrees.                                  |
| spc(n)                 | Returns a string of n spaces.                                |
| spoint(x,y)            | Reads the colour index on the sprite layer. 0 is transparency |
| sqr(n)                 | Square root of n                                             |
| str$(n)                | Convert n to a string                                        |
| tab(n)                 | Advance to screen column n if not past it already.           |
| tan(n)                 | Tangent of n, n Is in degrees.                               |
| true                   | Return constant -1, improves boolean readability             |
| time()                 | Return time since power on in 100^th^ of a seconds.          |
| uhasdata()             | Return true if there is data in the UART Receive buffer.     |
| upper$(a$)             | Convert a string to upper case                               |
| val(s$)                | Convert string to number. Error if bad number.               |
| vblanks()              | Return the number of vblanks since power on. This is updated at the start of the vblank period. |




## BASIC Commands (General)

| Command                                 | Notes                                                        |
| --------------------------------------- | ------------------------------------------------------------ |
| ' {string}                              | Comment. This is a string for syntactic consistency. The tokeniser will process a line that doesn't have speech marks as this is not common, so you can type in ' hello world and it will be represented as ' "hello world" in code. |
| assert {expr}[,{msg}]                   | Error generated if {expr} is zero, with optional message.    |
| call {name}(p1,p2,p3)                   | Call named procedure with optional parameters.               |
| cat [{pattern}]                         | Show contents of current directory, can take an optional string which only displays filenames containing those characters, so cat "ac" only displays files with the sequence ac in them. |
| clear [{address}]                       | Clear out stack, strings, reset all variables. If an address is provided then memory above that will not be touched by BASIC. Note because this resets the stack, it cannot be done in a loop, subroutine or procedure -- they will be forgotten. Also clears the sprites and the sprite layer. |
| close [handle]                          | Close a file by handle. If the handle is not provided, close all files. |
| cls                                     | Clear the graphics screen to current background colour. This does not clear sprites. |
| cursor {x},{y}                          | Set the text cursor position                                 |
| data {const},....                       | DATA statement. For syntactic consistency, strings must be enclosed in quote marks e.g. data |
| defchr ch,....                          | Define UDG ch (192-255) as a 6x7 font -- should be followed by 7 values from 0-63 representing the |
| delete                                  | Delete a line or range of lines                              |
| dim {array}(n,[m]), $...                | Dimension a one or two dimension string or number array, up to 255 |
| do ... exit ... loop                    | General loop you can break out of at any point.              |
| doke {addr},{data}                      | Write word to address                                        |
| edit                                    | Basic Screen Editor                                          |
| end                                     | End Program                                                  |
| fkey                                    | Lists the defined function keys                              |
| fkey {key},{string}                     | Define the behaviour of F1..F10 -- the characters in the string |
| for {var} = {start} to/downto           | For loop. Note this is non standard,Limitations are : the index must be an integer. Step can only be 1 (to) or -1 (downto). Next does not specify an index and cannot be used to terminate loops using the 'wrong' index. |
| gload {filename}                        | Load filename into graphics memory.                          |
| gosub {expr}                            | Call subroutine at line number. For porting only. See goto.  |
| goto {expr}                             | Transfer execution to line number. For porting only. Use in general coding is a capital offence. If I write RENUMBER it |
| if {expr} then ....                     | Standard BASIC if, executes command or line number. (IF .. GOTO doesn't work, use IF .. THEN nn) |
| if {expr}: .. else .. endif             | Extended multiline if, without THEN. The else clause is optional. |
| ink fgr[,bgr]                           | Set the ink foreground and optionally background for the console. |
| input {stuff}                           | Input has an identical syntax and behaviour to Print except that variables are entered via the keyboard rather than printed. |
| input #{channel},{var},{var}            | Reads a sequence of variables from the open file.            |
| input line #{channel}.{var}.{var}       | Reads text from an ASCII file. This is processed from the source, primarily due to Windows' usage of CR/LF. So this at current, by default, ignores all characters before space, except for LF (10) which marks the end of line, and TAB (9) which is converted into a space. All variables are strings |
| ireceive {d},{a},{s}                    | Send or receive bytes starting at a, count s to or from device d. |
| itransmit {d},{a},{s}                   |                                                              |
| isend {device},{data}                   | Send data to i2c {device} ; this is comma seperated data, numbers or strings. If a semicolon is used as a seperator e.g. 4137; then the constant is sent as a 16 bit value. |
| iwrite {dev},{reg},{b}                  | Write byte to I2C Device Register                            |
| let {var} = {expr}                      | Assignment statement. The LET is optional.                   |
| library                                 | Librarise / Unlibrarise code.                                |
| list [{from}][,][{to}]                  | List program to display by line number or procedure name.    |
| list {procedure}()                      |                                                              |
| load "file"[,{address}]                 | Load file to BASIC space or given address.                   |
| local {var},{var}                       | Local variables, use after PROC, restored at ENDPROC variables can |
| mon                                     | Enter the machine code monitor                               |
| mos {command}                           | Execute MOS command.                                         |
| mouse cursor {n}                        | Select mouse cursor {n} [0 is the default hand pointer]      |
| mouse show                              | hide                                                         |
| mouse TO {x},{y}                        | Position mouse cursor                                        |
| new                                     | Erase Program                                                |
| next {variable}                         | Ends for loop. The variable parameter is optional. You cannot unwind nested FOR/NEXTs , next must operate in order. |
| old                                     | Undoes a new. This can fail depending on what has been done since the 'new'. |
| on error {code}                         | Install an error handler that is called when an error occurs. Effectively this is doing a GOTO that code, so recovery is dependent on what you actually |
| open input\|output [channel],[file]     | Open a file for input or output on the given channel, using the given file name. Output erases the current file. This gives an error if the file does not exist ; rather than trap this error it is recommended to use the exists() function if you think the file may not be present. |
| palette c,r,g,b                         | Set colour c to r,g,b values -- these are all 0-255 however it is actually 3:2:3 colour, so they will be approximations. |
| palette clear                           | Reset palette to default                                     |
| pin {pin},{value}                       | Set UEXT {pin} to given value.                               |
| pin {pin} INPUT                         | output                                                       |
| poke {addr},{data}                      | Write byte to address                                        |
| print {stuff}                           | Print strings and numbers, standard format - , is used for   |
| print #{channel},{expr},{expr}          | Writes a sequence of expressions to the open file.           |
| print line #{channel}.{var}.{var}       | Prints a line to an output channel as an ASCII file, in LF format (e.g. lines are seperated by character code 10). This can be mixed with the above format *but* the sequence has to be the same ; you ann't write a string using print line and read it back with input and vice versa. All variables must be strings. |
| proc {name>([ref] p1,p2,...) .. endproc | Delimits procedures, optional parameters, must match call. Parameters can be defined as reference parameters and will return values. Parameters cannot be arrays. |
| read {var},...                          | Read variables from data statements. Types must match those in data statements. |
| renumber [{start}]                      | Renumber the program from start, or from 1000 by default. This does *not* handle GOTO and GOSUB. Use those, you are on your own. |
| repeat .. until {expr}                  | Execute code until {expr} is true                            |
| restore                                 | Restore data pointer to program start                        |
| restore {line}                          | Restore data pointer to line number                          |
| return                                  | Return from subroutine called with gosub.                    |
| run                                     | Run Program                                                  |
| run "{program}"                         | Load & Run program.                                          |
| save "file"[,{adr},{sz}]                | Save BASIC program or memory from {adr} length {sz}          |
| sreceive {a},{s}                        | Send or receive bytes starting at a, count s to SPI device   |
| stransmit {a},{s}                       |                                                              |
| ssend {data}                            | Send data to SPI device ; this is comma seperated data, numbers or strings. If a semicolon is used as a seperator e.g. 4137; then the constant is sent as a 16 bit value. |
| stop                                    | Halt program with error                                      |
| sys {address}                           | Call 65C02 machine code at given address. Passes contents of variables A,X,Y in those registers. |
| tilemap addr,x,y                        | Define a tilemap. The tilemap data format is in the API. The tilemap is stored in memory at addr, and the offset into the |
| uconfig {baud}[,{prt}]                  | Set the baud rate and protocol for the UART. Currently only 8N1 is supported. |
| ureceive {d},{a},{s}                    | Send or receive bytes to/from the UART starting at a, count s |
| utransmit {d},{a},{s}                   |                                                              |
| usend {device},{data}                   | Send data to UART ; this is comma seperated data, numbers or strings. If a semicolon is used |
| wait {cs}                               | Waits for {cs} hundredths of a second                        |
| while {expr} .. wend                    | Repeat code while expression is true                         |
| who                                     | Display contributors list.                                   |

## The Inline Assembler

The inline assembler works in a very similar way to that of the BBC Micro, except that it does not use the square brackets [ and ] to delimit assembler code. Assembler code is in normal BASIC programs.

A simple example shown below (in the samples directory). It prints a row of 10 asterisks.

Most standard 65C02 syntax is supported, except currently you cannot use lsr a ; it has to be just lsr (and similarly for rol, asl, ror,inc and dec).

You can also pass A X Y as variables. So you could delete line 150 and run it with X = 12: sys start which would print 12 asterisks.

| Line | Code            | Notes                                                        |
| ---- | --------------- | ------------------------------------------------------------ |
| 100  | mem = alloc(32) | Allocate 32 bytes of memory to store the program code.       |
| 110  | for i = 0 to 1  | We pass through the code twice because of forward referenced labels. This actually doesn't apply here. |
| 120  | p = mem         | P is the code pointer -- it is like $* = {xx} - it means put the code here |
| 130  | o = i * 3       | Bit 0 is the pass (0 or 1) Bit 1 should display the code generated on pass 2 only, this is stored in 'O' for options. |
| 140  | .start          | Superfluous -- creates a label 'start' -- which contains the address here |
| 150  | ldx #10         | Use X to count the starts                                    |
| 160  | .loop1          | Loop position. We can't use loop because it's a keyword      |
| 170  | lda #42         | ASCII code for asterisk                                      |
| 180  | jsr $fff1       | Monitor instruction to print a character                     |
| 190  | dex             | Classic 6502 loop                                            |
| 200  | bne loop1       |                                                              |
| 210  | rts             | Return to caller                                             |
| 220  | next            | Do it twice and complete both passes                         |
| 230  | sys mem         | BASIC instruction to 'call 6502 code'. Could do sys start here. |



### [ ] Operator

The [] operator is used like an array, but it is actually a syntactic equivalent of deek and doke, e.g. reading and writing 16 bytes. mem[x] means the 16 bit value in mem + x $* 2, so if mem = 813 then mem[2] = -1 writes a 16 bit word to 817 and 818, and print mem[2] reads it. The index can only be from 0..127

The purpose of this is to provide a clean readable interface to data in 65C02 and other programs running under assembly language ; often accessing elements in the 'array' as a structure.

### Zero Page Usage

Neo6502 is a clean machine, rather like the Sharp machines in the 1980s. When BASIC is not running it has no effect on anything, nor does the firmware. It is not like a Commodore 64 (for example) where changing some zero page locations can cause crashes.

However, BASIC does make use of zero page. At the time of writing this is memory locations $10-$41.

These can however be used in machine code programs called via SYS. Only 4 bytes of that usage is system critical (the line pointer and the stack pointer), those are saved on the stack by SYS, so even if you overwrite them it does not matter.

However, you can't use this range to store intermediate values *between* sys calls. It is advised that you work usage backwards from $FF (as BASIC is developed forwards from $10). It is very unlikely that these will meet in the middle.

$00 and $01 are used on BASIC boot (and maybe other languages later) but this should not affect anything.



## Basic Commands (Graphics)

The graphics commands are MOVE, PLOT (draws a pixel), LINE (draws a line) RECT (draws a rectangle) ELLIPSE (draws a circle or ellipse) IMAGE (draws a sprite or tile), TILEDRAW (draws a tilemap) and TEXT (draws text)

The keywords are followed by a sequence of modifiers and commands which do various things as listed below

| Keyword  | Notes                                                        |
| -------- | ------------------------------------------------------------ |
| from x,y | Sets the origin position, can be repeated and optional.      |
| to x,y   | Draw the element at x,y or between the current position and x,y depending on the command. So you could have **text "Hello" to 10,10** or **rect 0,0 to 100,50** |
| by x,y   | Same as to but x and y are an offset from the current position |
| x,y      | Set the current position without doing the action            |
| ink c    | Draw in solid colour c                                       |
| ink a,x  | Draw by anding the colour with a, and xoring it with x.      |
| solid    | Fill in rectangles and ellipses. For images and text, forces black background. |
| frame    | Just draw the outline of rectangles and ellipses             |
| dim n    | Set the scaling to n (for TEXT, IMAGE, TILEMAP only), so **text "Hello" dim 2 to 10,10 to 10,100** will draw it twice double size. Tiles can only be 1 or 2 (when 2, tiles are drawn double size giving a 32x32 tile map) |


These can be arbitrarily chained together so you can do (say) LINE 0,0 TO 100,10 TO 120,120 TO 0,0 to draw an outline triangle. You can also switch drawing type in mid command, though I probably wouldn't recommend it for clarity.

State is remember until you clear the screen so if you do INK 2 in a graphics command things will be done in colour 2 (green) until finished.

TEXT is followed by one parameter, which is the text to be printed, these too can be repeated 

`TEXT "Hello" TO 10,10 TEXT "Goodbye" DIM 2 TO 100,10`

IMAGE is followed by two parameters, one specifies the image, the second the 'flip'. These can be repeated as for TEXT.

The image parameter is 0-127 for the first 128 tiles, 128-191 for the first 64 16x16 sprites and 192-255 for the first 64 32x32 sprites. The flip parameter, which is optional, is 0 (no flip) 1 (horizontal flip) 2 (vertical flip) 3 (both).

An example would be 

`image 4 dim 2 to 10,10 image 192,3 dim 1 to 200,10`

Note that images are $*not$* sprites or tiles, they use the image to draw on the screen in the same way that LINE etc. do.



## Sprite Commands

Sprite commands closely resemble the graphics commands.

They begin with SPRITE {n} which sets the working sprite. Options include IMAGE {n} which sets the image, TO {x},{y} which sets the position, FLIP {n} which sets the flip to a number (bit 0 is horizontal flip, bit 1 is vertical flip), ANCHOR {n} which sets the anchor point and BY {x},{y} which sets the position by offset.

With respect to the latter, this is the position from the TO and is used to do attached sprites e.g. you might write.

`SPRITE 1 IMAGE 2 TO 200,200 SPRITE 2 IMAGE 3 BY 10,10`

Which will draw Sprite 1 and 200,200 and sprite 2 offset at 210,210. It does not offset a sprite from its current position.

As with Graphics these are not all required. It only changes what you specify not all elements are required each time *SPRITE 1 IMAGE 3* is fine.

SPRITE can also take the single command CLEAR ; this resets all sprites and removes them from the display

Sprite 127 is used for the turtle sprite, so if the turtle is turned on, then it will adjust its graphic, size to reflect the turtle position. If turtle graphics are not used, it can be used like any other.

### Implementation notes

Up to 128 sprites are supported. However, sprite drawing is done by the Pico and is not hardware, so more sprites means the system will run slower.

Additionally, the sprites are currently done with XOR drawing, which causes effects when they overlap. This should not be relied on (it may be replaced by a clear/invalidate system at some point), but the actual implementation should not change.

This is an initial sprite implementation and is quite limited.

(The plan is to add a feature like the animation languages on STOS and AMOS which effectively run a background script on a sprite)

## Sprite Support

### =spritex(n) =spritey(n)

These return the x and y coordinates of the sprites draw position (currently the centre) respectively.

### = hit(sprite#1,sprite#2,distance)

The hit function is designed to do sprite collision. It returns true if the pixel distance between the centre of sprite 1 and the centre of sprite 2 is less than or equal to the distance.

So if you wanted to move a sprite until it collided with another sprite, assuming both are 32x32, the collision distance would be 32 (the distance from the centre to the edge of both sprites added together), so you could write something like :

`x = 0`

`repeat`

`x = x + 1: sprite 1 to x,40`

`until hit(1,2,32)`

In my experience of this the distance needs to be checked experimentally, as it affects the 'feel' of the game ; sometimes you want near exact collision, sometimes it's about getting the correct feel. It also depends on the shape and size of the sprites, and how they move.

I think it's better than a simple box collision test, and more practical than a pixel based collision test which is very processor heavy.

## Sound Commands

The Neo6502 has four sound channels, 0-3 which can generate a square wave or white noise sounds.

The main sound command is called "sound" and has the following forms.

#### Sound clear

Resets the entire sound system, silences all channels, empties all queues

#### Sound {channel} clear

Resets a single channel ; silences it, and empties its queue

#### Sound {channel},{frequency},{time}[,{slide}]

Queues a note on the given channel of the given frequency (in Hz) and time (in centiseconds). These will be played in the background as other notes finish so you can 'queue up' an entire phrase and let it play by itself. The slide value adds that much to the frequency every centisecond allowing some additional effects (note, done in 50Hz ticks)

A mixture of the two syntaxes SOUND 0 CLEAR 440,200 is now supported.

To use the white noise feature use the keyword "noise" instead of sound.

### Sfx

Sfx plays sound effects. Sound effects are played immediately as they are usually in response to an event.

It's format is ***sfx** **{channel},{effect***} .



## Screen Editor

The ***edit*** command starts the screen editor. This currently supports left, right, home, end, backspace and delete on the current line, enter, up, down, page up and page down to change lines.

Esc exits the editor, and Ctrl+P and Ctrl+Q insert and delete a whole line.

Note the editor is slightly eccentric ; it is not a text editor, what it is doing is editing the underlying program on the fly -- much the same as if you were typing lines in.

The editor uses line numbers, so is *not* compatible with their use in programs. Any program will be renumbered from 1 upwards in steps of 1 (except library routines).

You shouldn't be using line numbers anyway !





## Libraries

Libraries are part of the BASIC program, placed at the start. However, their line numbers are all set to zero. (So you cannot use GOTO or GOSUB in libraries, but you should only use them for porting old code).

NEW will not remove them, LIST does not show them (except LIST 0), You cannot edit them using the line editors.

However RUN does not skip them. This is so you can have initialisation code e.g.

{do initialisation code}

`if false`

`proc myhw.dosomething(p1) ....`

`proc myhw.panic()`

`endif`

To support this, there is a LIBRARY command. LIBRARY on its own undoes the library functionality. It renumbers the whole program from the start, starting from line number 1000.

Otherwise LIBRARY works like LIST. You can do LIBRARY {line} or LIBRARY {from},{to} and similar. Instead of listing this code, it causes them to "vanish" by setting their line numbers to zero.

They are also supported in the makebasic script. Adding the command library makes all code so far library code.

e.g.

python makebasic.zip mylib.bsc library mainprogram.bsc



## Turtle Graphics

The Neo6502 has a built in turtle graphics system. This uses sprite $7F as the turtle, which it will take over, so it cannot be used for other purposes.

The following commands are supported.

| Command     | Purpose                                                      |
| ----------- | ------------------------------------------------------------ |
| forward {n} | Move turtle forward n (pixel distance)                       |
| left {n}    | Rotate turtle at current position                            |
| right {n}   |                                                              |
| penup       | Does not draw as the turtle moves                            |
| pendown     | Draw as the turtle moves in the current colour               |
| pendown {n} | Draw as the turtle moves in colour {n}                       |
| turtle home | Reset turtle to home position, facing up the screen.         |
| turtle hide | Hide the turtle                                              |
| turtle show | Show the turtle                                              |
| turtle fast | The turtle is deliberately slowed to give it an animated feel so you can see the drawing, this is because it's primary purpose is educational. This makes it go full speed. |


There is an example in the crossdev folder which gives some idea on how to get started.



