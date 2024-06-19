

# Memory Map

Note *all this is actually RAM* and functions as it, except for the command area ; writing non zero values into the Command byte may affect other locations in that 16 byte area or elsewhere (e.g. reading a file in).

This block is however moveable.

It is also possible that the top of free memory will move down from $FC00.

| Addresses | Contents                                                     |
| --------- | ------------------------------------------------------------ |
| 0000-FBFF | Free memory. Not used for anything.                          |
| FC00-FEFF | Kernel Image. Contains system functions and WozMon,  which it currently boots into. This is RAM like everything else. |
| FFF0-FF0F | Command, Error, Parameters, Information space. This can be moved to accommodate other systems. |
| FF10-FFF9 | Vectors to Kernel routines, not actually mandatory either.   |
| FFFA-FFFF | 65C02 Vectors for NMI, IRQ and Reset. This one is mandatory. |

 