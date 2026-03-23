Make_-_Lib

A minimal experimental project focused on low-level C programming, Makefile automation, shared/static libraries, and ARM cross-compilation.

---

📁 Project Structure

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

🧠 Overview

This repository demonstrates:

- Writing and using a custom C library
- Separating interface (".h") and implementation (".c")
- Building:
  - Object files (".o")
  - Shared libraries (".so")
  - Static binaries
- Manual linking using Makefile
- Memory management ("malloc" / "free")
- Pointer casting using "void*"
- Cross-compiling to ARM32 and ARM64 assembly

---

⚙️ Library API

Data Structure

typedef struct {
    float x, y, z;
} coord_t;

Functions

void* set_coord(float x, float y, float z);
void print_coord(void* point);
void* update_coord(void* point, coord_t* updated);

- "set_coord" → allocates and initializes a coordinate (heap)
- "print_coord" → prints "(x, y, z)"
- "update_coord" → modifies an existing coordinate

---

🔨 Build Targets

Build everything

make

---

Static build

make run

Output:

build/static/libl_usage

---

Shared library build

make srun

- Builds ".so" in "build/shared"
- Runs binary with "LD_LIBRARY_PATH" set

Output:

build/shared/libl_usage

---

Generate ARM assembly

make asm

Outputs:

- "asm/armf/*.s" → ARM32
- "asm/aarch64/*.s" → ARM64

---

Clean

make clean

---

🧪 Example Usage

coord_t *p = (coord_t*)set_coord(2, 4, 3);
print_coord(p);
free(p);

---

⚠️ Notes

- Memory from "set_coord" must be freed
- Do not call "free()" on stack memory
- Shared libraries require "LD_LIBRARY_PATH"
- "void*" is used for generic interface experimentation

---

🧩 Assembly

Assembly output is generated using:

- ARMv7 (32-bit)
- AArch64 (64-bit)

Useful for inspecting compiler output and learning low-level behavior.

---

🎯 Purpose

This project is intended for:

- Learning Makefile internals
- Understanding linking (static vs shared)
- Practicing low-level C concepts
- Exploring cross-compilation and architecture differences

---

📜 License

See "LICENSE" file.
