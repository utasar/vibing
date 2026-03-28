# Vibing Repository

The `Vibing` repository contains projects and assignments from my **Assembly Language** class. It demonstrates my skills in **low-level programming**, optimized logic building, and working closely with the hardware through Assembly. Additionally, it includes examples of how concepts from **AI** can be explored in tandem with assembly-level programming tasks.

## Language Composition

This repository is primarily focused on:
- **Assembly (80%)**: Core projects and exercises built using assembly language, showcasing logical optimization and hardware-level interaction.
- **C (12.6%)**: Supplemental programs for more complex processing or integrating assembly with high-level logic.
- **Shell (7.4%)**: Scripts to manage, test, and execute the programs efficiently.

## About the Project

The contents of this repository include:
- Assembly programming examples and assignments.
- Optimized algorithms written in assembly to demonstrate hardware efficiency.
- Integration of AI logic into assembly code, showing how higher-level AI concepts can be translated into low-level instructions.
- Usage of C programs to bridge high-level logic with assembly routines.

This repository reflects my ability to work across multiple programming paradigms and design systems that are efficient at a hardware level while also being capable of implementing modern AI concepts.

## How to Use

1. Clone the repository to your device:
   ```bash
   git clone https://github.com/utasar/vibing.git
   ```
2. Navigate to the directory:
   ```bash
   cd vibing
   ```
3. Compile the Assembly and C files:
   - For Assembly:
     ```bash
     nasm -f elf64 program.asm -o program.o
     ld program.o -o program
     ./program
     ```
   - For C (and integration with assembly):
     ```bash
     gcc -o combined_program program.c program.asm
     ./combined_program
     ```
4. Shell scripts (if applicable) can be used to automate compilation and execution:
   ```bash
   ./run_script.sh
   ```

## Highlights

- **AI with Assembly**: Demonstrating how artificial intelligence methods, such as decision trees or minimax algorithms, can be translated into low-level optimized logic.
- **Performance**: Emphasis on writing performance-critical code that is efficient and works directly with the hardware.
- **Integration**: Bridging the gap between Assembly and high-level languages through C.

## Why This Project?

The `Vibing` repository is an opportunity to showcase my expertise in assembly language programming and systems-level development. It reflects my understanding of low-level programming concepts matched with my interest in applying AI logic to hardware-level programming tasks. This combination highlights my ability to work across disciplines, which is a valuable skill for modern software development roles.
