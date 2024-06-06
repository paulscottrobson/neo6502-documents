# Getting the board running

This section helps you get the board up and running with the Morpheus software. If you want to use the Apple, Oric or C64 emulators, the process is similar, but you use a different UF2 file.![image-20240604165131065](assets/image-20240604165131065.png)

## Setting the DIP switches

There is a small configuration slide switch next to the long connector on one side of the board, marked "SWITCH1". Olimex supplies these as "all on" (as per the diagram above).

Switch 1 enables and disables the buzzer. Switches 2-4 connect UEXT lines to NMI, IRQ and Reset and it is strongly recommended that these are set to off.

## USB Key

The USB key should be formatted to FAT32

## Wiring it up

1. Plug the HDMI Monitor into the HDMI connector using a standard HDMI cable.
2. Plug the USB hub, if you are using one, or the keyboard, into the USB host socket and plug the Gamepad, USB Key and Keyboard into the USB host
3. Plug the power cable into the USB C socket, and connect the other end to power.

This *should* boot up the Apple 2 emulator, which should appear in the form of a menu of games, which you can select and run using the keyboard.

If not, try removing the USB host and just plugging the keyboard into the middle socket.

If this doesn't work, try reprogramming it with Morpheus (see below) and see what happens there.

#### Note for SD Card users

If you are using the SD card it should come with a short ribbon cable which plugs into the SDCard board and the UEXT socket on the Neo6502 board.

## Reprogramming with Morpheus

First you need to download the current release of the Morpheus software [here](https://github.com/paulscottrobson/neo6502-firmware) . 

The releases are on the right of the screen, the current release is 0.30.0. Clicking on it should show the releases page which has a link to "neo6502.zip"

Download and extract this file. You will see something like this, this is Linux, but it will be very similar on Windows or Macintosh.

![image-20240604165944920](assets/image-20240604165944920.png)

Initially you need one of the two files in the middle "firmware_usb.uf2" or "firmware_sd.uf2". Most people will need the first one, the second one is if you use the SD Card for storage.

You can also copy the examples/basic files to your storage device (normally the USB key). It is recommended you create one file just for testing.

1. Remove the keyboard or USB hub from the middle socket, and connect the Neo6502 board to your PC using the A-A cable - this should fit into any standard PC socket.
2. Turn the power to the board off.
3. You now need to put the board into "Upload" mode. This is a similar upload to any other Pi Pico device. Hold the boot button down (see the picture above) and turn the power back on, then release the boot button. If you have already put the board in the case there is a hole to access the boot button which needs something thin and pointy (I use an old multimeter probe)

The board should now appear in the file system of your host computer. For example, on Linux/Gnome it is like this. Exactly what you see will depend on your operating system and desktop, but you should see "RPI-RP2" mounted as a drive.

![image-20240604170609008](assets/image-20240604170609008.png)

You now need to copy the uf2 file above to this drive. This again depends on the system you are using.

Hopefully the system should now boot. The machine should make it's boot sound (a low beep and a high beep - it sounds like a BBC Micro) [listen here](https://www.youtube.com/watch?v=Nd9MzxIbuQI) and it should display the Neo6502 logo, title, and Olimex title.

**Finally** unplug the A cable and plug the USB hub or keyboard back in. More than once I have forgotten to do this and wondered why the keyboard is not working.

## What does the boot mean

Below the logos, you should see.

### Morpheus Version

The Morpheus title and version in Yellow - it currently says "Morpheus Firmware: v 0.28.1"

### Storage Type

It should say "USB Storage" or "SD Card Storage" depending on your choice of firmware

### USB Devices

Your USB devices should now be listed. Mine says:

- No driver found for 04D9:0006 (this is the Pi Pico USB hub I think)
- USB Key found 0781:55a3
- Gamepad driver found 081f E401

Not all devices are detected, this does not matter.

[Checking it works and a look round](tryingout.md)