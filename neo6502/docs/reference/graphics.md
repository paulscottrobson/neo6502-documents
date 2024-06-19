

# Graphics

## Pixel Colours

| Pixel | Colour            |
| ----- | ----------------- |
| 0     | Black/Transparent |
| 1     | Red               |
| 2     | Green             |
| 3     | Yellow            |
| 4     | Blue              |
| 5     | Magenta           |
| 6     | Cyan              |
| 7     | White             |
| 8     | Black             |
| 9     | Dark Grey         |
| 10    | Dark Green        |
| 11    | Orange            |
| 12    | Dark Orange       |
| 13    | Brown             |
| 14    | Pink              |
| 15    | Light Grey        |

## Tile Maps

A tile map occupies an area of user memory in 65C02. It is comprised of three meta-data bytes, followed by one byte for each tile, which is it's tile number in the graphic file (refer to the following section).

F0-FF are special reserved tile numbers, F0 is a transparent tile; and F1-FF are a solid tile in the current palette colour. The format is very simple.

**Tile Maps Format**

| Offset | Data   | Notes                                      |
| ------ | ------ | ------------------------------------------ |
| 0      | 1      | Graphics Data Format ID                    |
| 1      | Width  | Width of tile-map (number of tiles)        |
| 2      | Height | Height of tile-map (number of tiles)       |
| 3..    | Raw    | Tiles graphics data (width * height bytes) |

## Graphic Data

The graphic data for a game is stored in what is named by default "graphics.gfx". This contains up to 256 graphics objects, in one of three types. One can have multiple graphics files.

Each has 15 colours (for sprites, one is allocated to transparency) which are the same as the standard palette.

#### 16x16 tiles (0-127, $00-$7F)

These are 128 16x16 pixel solid tiles which can be horizontally flipped

#### 16x16 sprites (128-191, $80-$BF)

These are 64 16x16 sprites which can be horizontally and/or vertically flipped

#### 32x32 sprites (192-255, $C0-$FF)

These are 64 32x32 sprites which can be horizontally and/or vertically flipped

These are created using two scripts, which are written in Python and require the installation of the Python Imaging Library, also known as PIL or Pillow.

### Empty graphics files

The script "createblanks.zip" creates three files, tile_16.png, sprite_16.png and sprite_32.png which are used for the three types of graphic.

The sprite and tile files all look very similar. The palette is shown at the top (in later versions this will be configurable at this point), and some sample sprites are shown. Each box represents a 16x16 sprite. 32X32 sprite looks the same except the boxes are twice the size and there are half as many per row.

Tiles are almost identical ; in this the background is black. The solid magenta (RGB 255,0,255) is used for transparency, this colour is not in the palette.

Running createblanks.zip creates these three empty files. To protect against accidents it will not overwrite currently existing files, so if you want to start again then you have to delete the current ones.

### Compiling graphics files

There is a second script "makeimg.zip". This converts these three files into a file "graphics.gfx" which contains all the graphic data.

This can be loaded into graphics image memory using the gload command, and the address 65535 e,g, ***gload "graphics.gfx"*** or the API equivalent

There is an example of this process in the repository under basic/images which is used to create graphic for the sprite demonstation program