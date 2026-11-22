Pacman
======

![in-game screenshot](https://libregamewiki.org/images/1/18/Pacman.png "in-game screenshot")

A clone of the original Pac-Man, created by Toru Iwatani at Namco. It was inspired by Paul Neave's Pac-Man clone, and one of its main goals is very low CPU usage.

## Build ##

You need make, g++, pkg-config and the development packages of SDL2, SDL2_image, SDL2_ttf and SDL2_mixer. On Fedora:
```
sudo dnf install make gcc-c++ pkgconf-pkg-config SDL2-devel SDL2_image-devel SDL2_mixer-devel SDL2_ttf-devel
```
Then run `make` in the pacman directory and start the game with `./pacman`.

## Installation ##

```
make PACKAGE_DATA_DIR=/usr/local/share/pacman
sudo make install
```
To use another prefix, keep `PACKAGE_DATA_DIR` equal to `$(PREFIX)/share/pacman`:
```
make PACKAGE_DATA_DIR=/usr/share/pacman
sudo make PREFIX=/usr install
```
`sudo make uninstall` (with the same `PREFIX`) removes the installed files.

## License ##

GNU General Public License version 2 (or any later version).

## Authors ##

* Daniel Würfel <ebuc99@googlemail.com>
* Martin Prussak
