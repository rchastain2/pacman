#ifndef PLATFORM_H
#define PLATFORM_H

#include <string.h>
#include <stdlib.h>
#include <errno.h>
#ifdef _WIN32
#include <direct.h>
#include <io.h>
#include <sys/stat.h>
#include <sys/types.h>
#else
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#endif
#include <iostream>
#include <string>

std::string getFilePath(const char *file);

std::string getGameDirPath(const char *fileName = NULL);

void createGameDir();

bool fileExists(const char *filePath);

bool isDirectory(const char *path);

#endif
