# 🚀 Make_-_Lib

A minimal experimental project for low-level C, Makefiles, libraries, and ARM cross-compilation.

---

## 📁 Project Structure

```
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
```

---

## 🧠 Overview

This project demonstrates:

- 🧩 Custom C library design
- 📦 Static and shared linking
- ⚙️ Makefile automation
- 🧠 Memory management (malloc / free)
- 🔄 Pointer casting using void*
- 🧬 ARM32 & ARM64 assembly generation

---

## ⚙️ Library API

### 📌 Structure

```c
typedef struct {
    float x, y, z;
} coord_t;
```

### 📌 Functions

```c
void* set_coord(float x, float y, float z);
void print_coord(void* point);
void* update_coord(void* point, coord_t* updated);
```

---

## 🔨 Build Commands

```bash
make        # build everything
make run    # run static binary
make srun   # run shared binary
make asm    # generate ARM assembly
make clean  # clean build files
```

---

## 🧪 Example Usage

```c
coord_t *p = (coord_t*)set_coord(2, 4, 3);
print_coord(p);
free(p);
```

---

## ⚠️ Notes

- ❗ Always free memory from set_coord
- ❌ Do not free stack memory
- 📦 Shared libs require LD_LIBRARY_PATH
- 🔄 void* used for generic interface testing

---

## 🎯 Purpose

- Learn Makefile internals
- Understand linking (static vs shared)
- Practice low-level C
- Explore cross-compilation & architectures

---

## 📜 License

See LICENSE file.
