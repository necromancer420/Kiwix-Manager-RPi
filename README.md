# Kiwix-Manager-RPi
Installs Kiwix-Serve, downloads zim files, and manages Zim Library. 
| ![Screenshot](https://github.com/necromancer420/localassets/blob/main/Kiwix-Screenshot.png) | 
|:--:| 
| Made for the Raspberry Pi OS (Ubuntu/Debian) |

## Purpose
Kiwix Manager is a simple script designed to handle all the dirty work of installing and managing a Kiwix Serve Installation on a current version of Raspberry Pi OS.

## Installation

Change Directory into your Downloads Folder

Clone this Git

Chmod the Script

Run the Script

```bash
cd ~/Downloads
git clone https://github.com/necromancer420/Kiwix-Manager-RPi.git
cd Kiwix-Manager-RPi
chmod u+x Kiwix-Manager-setup.sh
./Kiwix-Manager-setup.sh
```

## Usage
After the setup program finishes, it will run Kiwix-Manager.sh. If you close the program and need to run it again, just navigate to the Kiwix-Manager folder in your home directory, and run the script, or for your convenience a desktop icon is created for you.

If you have already installed Kiwix, that's ok, you can download zim files and manage your library from this script anyway. Upon first run of the app, it will ask where you would like to put your library and your files (separately). You can simply point to the locations you specified when you setup Kiwix initially. If you are installing from scratch, you can use the same location for both the library and the zim files, if you'd like.

Kiwix-Serve will not serve an empty or missing Library file. If you have setup Kiwix and it doesn't appear to be working, you probably haven't setup your library file correctly. This script can help you with that too.

*DO NOT RUN AS SUDO*

```bash
cd ~/Kiwix-Manager
./Kiwix-Manager.sh
```

## License
[Unilicense](https://choosealicense.com/licenses/unlicense/#)
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <https://unlicense.org>

---------
