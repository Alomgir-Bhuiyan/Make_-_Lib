# Make_-_Lib

A minimal experimental project focused on low-level C programming, Makefile automation, shared/static libraries, and ARM cross-compilation.

---

## Project Structure

.
├── LICENSE
├── Makefile
├── README.md
├── asm
│   ├── aarch64        # Generated ARM64 assembly
│   └── armf           # Generated ARM32 assembly
├── build
│   ├── shared         # Shared library outputs (.so)
│   └── static         # Statically linked binaries
├── lib
│   ├── libl.c         # Library implementation
│   └── libl.h         # Library interface
└── libl_usage.c       # Example program using the library

---

## Overview

This repository demonstrates:

- Writing and using a custom C library
- Separating interface (.h) and implementation (.c)
- Building:
  - Object files (.o)
  - Shared libraries (.so)
  - Static binaries
- Manual linking using Makefile
- Memory management (malloc / free)
- Pointer casting using void*
- Cross-compiling to ARM32 and ARM64 assembly

---

## Library API

typedef struct {
    float x, y, z;
} coord_t;

Functions:

void* set_coord(float x, float y, float z);
void print_coord(void* point);
void* update_coord(void* point, coord_t* updated);

---

## Build

make          # build everything
make run      # run static binary
make srun     # run shared binary
make asm      # generate assembly
make clean    # clean build files

---

## Example

coord_t *p = (coord_t*)set_coord(2, 4, 3);
print_coord(p);
free(p);

---

## Notes

- Memory from set_coord must be freed
- Do not free stack memory
- Shared libraries require LD_LIBRARY_PATH
- void* is used for generic interface experimentation

---

## Purpose

Learning Makefile internals, linking, memory handling, and cross-compilation.
