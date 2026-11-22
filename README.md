Pacman
======

![in-game screenshot](https://libregamewiki.org/images/1/18/Pacman.png "in-game screenshot")

This is a clone of the original Pac-Man, created by Toru Iwatani at Namco, as I remember, that I played for the first time on an Atari 130 XL in the early 90s.

Also, Paul Neave's Pac-Man clone has inspired me greatly.

One of the main goals of this implementation is an SDL application with a very low CPU usage.


## Build hint ##

You have to compile the Linux version on your own. For this, you'll need
* make
* g++
* pkg-config
* libsdl2
* sdl2-image
* sdl2-ttf
* and sdl2-mixer.

(make sure to take the devel packages)
Then, download and extract the zip file or clone the pacman repository.
Inside the pacman directory, run
```
make
```
and start the game from the pacman directory with `./pacman`.

## Installation ##

To install the game system-wide, build it with the installation data directory, then install it:
```
make PACKAGE_DATA_DIR=/usr/local/share/pacman
sudo make install
```
After a successful installation, you should be able to start the game via command line: `pacman`

The installation prefix can be changed with `PREFIX` (default: `/usr/local`), as long as `PACKAGE_DATA_DIR` matches `$(PREFIX)/share/pacman`:
```
make PACKAGE_DATA_DIR=/usr/share/pacman
sudo make PREFIX=/usr install
```
`sudo make uninstall` (with the same `PREFIX`) removes the installed files.

## Build on Fedora ##

```
sudo dnf install make gcc-c++ pkgconf-pkg-config SDL2 SDL2-devel SDL2_image SDL2_image-devel SDL2_mixer SDL2_mixer-devel SDL2_ttf SDL2_ttf-devel
```
Then, download and extract the zip file or clone the pacman repository.
Inside the pacman directory, run
```
make
```

## License ##
Pacman is licensed under the terms of the GNU General Public License version 2 (or any later version).

## Authors ##
* Daniel Würfel <ebuc99@googlemail.com>
* Martin Prussak
