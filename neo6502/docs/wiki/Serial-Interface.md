---
---
# Neo6502 Serial Interface

## Introduction
Neo6502 supports a serial interface as a back door to the machine. It allows the direct injection of code and data into program or graphic memory and the arbitrary insertion of keys into the keyboard buffer.

The original method of doing this in the keyboard input did not work on some machines. This has now been moved out. It can be started either by typing a / RETURN at the command line, or programmatically (see API pdf).

So you could, for example, have a program loaded and run, and when you exit it switch back to 'upload' mode.

## Connections
The easiest way to connect is via the UEXT port as per the Neo6502 manual, connecting the ground line to pin 2 and TXD and RXD to pins 3 and 4 (though at present the receive is not used). It currently operates at 460kbps which is pretty quick. 

If anyone has problems please let me know and we can try a reduced speed version.
***
![](https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/UEXTPINS.jpg/220px-UEXTPINS.jpg)
***
## Software
The Python script nxmit.zip allows transmission of tokenised BASIC, arbitrary data and graphic data.

```
python nxmit.zip <port> <cmd list>
	<port> is COM1 or /dev/ttyUSB0 or similar.
	Commands supported are :
		b:<file>		loads <file> as BASIC
		g:<file>		loads <file> into Graphic Memory
		f:<file>@<hex>		Loads <file> into CPU Memory at address <hex>
		k:<text>		Push text into keyboard buffer. Use ! for return
```

A typical command would be
``` python nxmit.zip /dev/ttyUSB0 B:mycode.bas G:mygraphics.gfx K:RUN!```

Additionally it can be used as a library, which allows you to write Python scripts to do things automatically - if you unzip nxmit.zip it is one file called __main__.py, which can be renamed, or the original is in the repository.
