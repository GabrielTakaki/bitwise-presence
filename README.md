# bitwise-presence

A RISC-V Assembly project to track student attendance using minimal memory, applying bit manipulation techniques.

## 📋 Project Description

This project implements an attendance register for a course with **16 class days** and a maximum of **32 students**, using **RISC-V assembly language**.  
Each day's attendance is stored in a **single 32-bit integer**, where each bit represents a student's presence (1) or absence (0).  

By default, all students are marked as present (`0xFFFFFFFF`). The professor can update attendance status through a simple terminal interface.

## 📌 Features

- Efficient memory usage: 16 integers represent the entire attendance matrix (16 days × 32 students).
- Bitwise manipulation to update presence or absence.
- Infinite loop with interactive prompts for:
  - Class day (0–15)
  - Student ID (0–31)
  - Attendance type (1 = present, 0 = absent)

## 🧠 Bitmask Logic

- **Absence** is registered by **clearing the corresponding bit** using an AND operation with an inverted mask.
- **Presence** is (re)set by **turning the corresponding bit ON** using an OR operation with a mask.

Example:
- To **mark absence** of student 2 on day 5: clear bit 2 of the 6th word.
- To **mark presence** of student 20 on day 3: set bit 20 of the 4th word.

## 🛠️ Technologies Used

- [RISC-V Assembly](https://riscv.org/)
- Tested with [RARS Simulator](https://github.com/TheThirdOne/rars) (Recommended)

## 🔄 How It Works

1. On startup, a 16-word vector is initialized with all bits set (`0xFFFFFFFF`).
2. The program enters an infinite loop asking the user to:
   - Enter the class number
   - Enter the student number
   - Enter the type of registration (presence or absence)
3. It builds a bitmask based on the inputs.
4. Applies the bitmask to the correct day using logical operations.
5. Loops back to accept the next input.

## 📎 Example Console Messages

```text
Enter the class number (0 to 15):
Enter the student number (0 to 31):
Enter the type of registration (presence = 1; absence = 0):
