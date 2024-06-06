
# 🏷️ Project Name

Implementation of some assembly algorithms

---
## 🗂️ Table Of Contents

- [Project Overview](#-project-overview)
- [Technology Stack](#-technology-stack)
- [Installation](#-installation)
- [Usage](#-usage)
- [Running the Project](#-running-the-project)
- 
---

## 📚 Project Overview

-A simple cat program, 
-prompt the user to input a single digit number, 
-subtract a constant of 5 from the number and determine whether the result is a positive or negative integer, 
-will prompt for and then take two single digit numbers as input, add them together and display the output, 
-adding any two single digits supplied by the user, input 2 double digit numbers and output the quotient and remainder 

---

## 🛠️ Technology Stack 

### Project code language used

 ![Java](https://img.shields.io/badge/Kotlin-B125EA&style=for-the-badge&logo=kotlin&logoColor=white)

## 💻 IDE

 ![VSCode](https://img.shields.io/badge/VSCode-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white)

## 📝 Installation

1. Clone the repository
2. Navigate to the main directory.
3. Install GDB and c++ using GCC and YASM
4. Use GDB to import asm file and run it

---

## 🎮 Usage

Can be run in vs code or terminal.

---

## 🏃🏻‍♂️ Running The Project

1. Run the command yasm -f elf32 "program name here".asm -o "program name here".o in terminal to create object files
2. Run the command gcc -m32 "program name here".o -o "program name here" to link the object file to GCC
3. Run the command gdb program in terminal
4. Set a breakpoint at the start of your function break _"your functio name"
5. Run the commands as desired such as info registers, run, next, continue, quit to go through the function and see the values in the regisrers
6. Run print $eax (or any other register) to see the value.

---



