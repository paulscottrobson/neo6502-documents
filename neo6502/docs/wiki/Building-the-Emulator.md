---
---
# Building the Emulator

## Releases

The release tarballs contain pre-built firmware, emulators for windows and *nixes, documentation, and examples/demos of BASIC, C, and assembly programs.
* [Release is here](https://github.com/paulscottrobson/neo6502-firmware/releases)

## Compilation

### Dependencies

- 'build-essential', 'base-devel', or equivalent (GCC for *nix binaries)
- 'x86_64-w64-mingw32-g++' or equivalent (GCC for windows binaries)
- 64tass (6502 assembler)
- SDL2 development library
- 'python3'
    - 'pillow'
    - 'gitpython'
    - 'pyserial' (optional for uploading files via serial port, not needed to build)

All of the sources and dependencies are freely available.
Most distros have the dependencies packaged.

* Arch-based distros:  
  _NOTE: '64tass' is in the AUR ([AUR Link](https://aur.archlinux.org/packages/64tass))_.
  
  * *nix emulator:
    ```
    $ sudo pacman -S 64tass python-gitpython python-pillow sdl2 zip
    ```
  * Windows emulator:
    ```
    $ sudo pacman -S 64tass mingw-w64-gcc python-gitpython python-pillow sdl2 zip
    ```
  
* Debian-based distros:
  * *nix emulator:
    ```
    $ sudo apt install 64tass build-essential cmake libsdl2-dev python3 python3-pip zip
    ```
  * Windows emulator:
    ```
    $ sudo apt install 64tass build-essential cmake g++-mingw-w64-x86-64 libsdl2-dev mingw-w64 python3 python3-pip zip
    ```

### Build

Build the windows emulator:

```
$ make windows
```

Build the *nix emulator:

```
$ make linux
```

Build the mac emulator:

```
$ make macos
```
