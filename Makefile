CXX      ?= g++
PKGS     := sdl2 SDL2_image SDL2_ttf SDL2_mixer
CXXFLAGS ?= -Wall -O2

PREFIX   ?= /usr/local
BINDIR   ?= $(PREFIX)/bin
DATADIR  ?= $(PREFIX)/share/pacman
APPDIR   ?= $(PREFIX)/share/applications

PACKAGE_DATA_DIR ?= data

CPPFLAGS += $(shell pkg-config --cflags $(PKGS)) -DPACKAGE_DATA_DIR=\"$(PACKAGE_DATA_DIR)\" -MMD -MP
LDLIBS   += $(shell pkg-config --libs $(PKGS))

SRCS   := $(wildcard src/*.cpp)
OBJS   := $(SRCS:.cpp=.o)
DEPS   := $(OBJS:.o=.d)
STAMP  := src/data_dir.stamp
TARGET := pacman

.PHONY: all clean install uninstall FORCE

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(LDFLAGS) $(OBJS) -o $@ $(LDLIBS)

src/%.o: src/%.cpp
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -c $< -o $@

$(STAMP): FORCE
	@echo '$(PACKAGE_DATA_DIR)' | cmp -s - $@ || echo '$(PACKAGE_DATA_DIR)' > $@

src/platform.o: $(STAMP)

install:
	@test -f $(TARGET) || { echo "$(TARGET) not found: run 'make PACKAGE_DATA_DIR=$(DATADIR)' first."; exit 1; }
	@test "$$(cat $(STAMP))" = "$(DATADIR)" || { echo "$(TARGET) looks for its data in '$$(cat $(STAMP))', not '$(DATADIR)': run 'make PACKAGE_DATA_DIR=$(DATADIR)' first."; exit 1; }
	install -d $(DESTDIR)$(BINDIR) $(DESTDIR)$(DATADIR) $(DESTDIR)$(APPDIR)
	install -m 755 $(TARGET) $(DESTDIR)$(BINDIR)/$(TARGET)
	cp -R data/fonts data/gfx data/sounds data/txt $(DESTDIR)$(DATADIR)/
	sed 's|^Icon=.*|Icon=$(DATADIR)/gfx/pacman_desktop.png|' pacman.desktop > $(DESTDIR)$(APPDIR)/pacman.desktop

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/$(TARGET) $(DESTDIR)$(APPDIR)/pacman.desktop
	rm -rf $(DESTDIR)$(DATADIR)

clean:
	rm -f $(TARGET) $(OBJS) $(DEPS) $(STAMP)

-include $(DEPS)
