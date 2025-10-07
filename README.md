# 🎯 CEG3310/5310 Computer Organization - Ultimate Study Hub

> **One-stop repository for all study materials, code templates, and exam prep**
## test
---

## 📚 Quick Navigation
- [📖 Comprehensive Study Guides](#-comprehensive-study-guides)
- [💻 LC3 Code Templates](#-lc3-code-templates)
- [🎯 Exam Cheat Sheets](#-exam-cheat-sheets)
- [🔢 Core Concepts](#-core-concepts)
- [⚡ Quick Reference](#-quick-reference)

---

## 📖 Comprehensive Study Guides

### Midterm Study Guide
- [Midterm Topics Breakdown](Study-Guides/Midterm-Study-Guide.md)
- [Common Exam Questions](Study-Guides/Midterm-Common-Questions.md)

### Final Exam Study Guide  
- [Final Exam Topics](Study-Guides/Final-Study-Guide.md)
- [Comprehensive Review](Study-Guides/Final-Review.md)

---

## 💻 LC3 Code Templates

### Basic Programs
- [Exponent Calculation](LC3-Programming/Examples/exponent.asm)
- [For Loops](LC3-Programming/Examples/for-loop.asm)
- [If-Else Statements](LC3-Programming/Examples/if-else.asm)
- [Array Input](LC3-Programming/Examples/array-input.asm)

### Advanced Patterns
- [Stack Frame Template](LC3-Programming/Templates/stack-frame.asm)
- [Subroutine Template](LC3-Programming/Templates/subroutine.asm)
- [I/O Template](LC3-Programming/Templates/io-template.asm)

---

## 🎯 Exam Cheat Sheets

### Quick References
- [LC3 Instruction Set](Exam-Prep/LC3-Instructions-Cheatsheet.md)
- [TRAP Routines](Exam-Prep/TRAP-Cheatsheet.md)
- [Common Code Snippets](Exam-Prep/Code-Snippets.md)

### Practice Exams
- [Practice Midterm 1 with Solutions](Exam-Prep/Practice-Midterm-1.md)
- [Practice Midterm 2 with Solutions](Exam-Prep/Practice-Midterm-2.md)
- [Practice Midterm 3 with Solutions](Exam-Prep/Practice-Midterm-3.md)

---

## 🔢 Core Concepts

### Data Representation
- [Binary/Hex/Decimal Conversion](Core-Concepts/Number-Conversion.md)
- [Two's Complement](Core-Concepts/Twos-Complement.md)
- [Floating Point](Core-Concepts/Floating-Point.md)

### Computer Architecture
- [Von Neumann Model](Core-Concepts/Von-Neumann.md)
- [LC3 Datapath](Core-Concepts/LC3-Datapath.md)
- [Memory & Cache](Core-Concepts/Memory-Cache.md)

---

## ⚡ Quick Reference

### Essential LC3 Instructions
| Instruction | Format | Purpose |
|-------------|--------|---------|
| `ADD` | `ADD DR, SR1, SR2` | Addition |
| `LD` | `LD DR, LABEL` | Load PC-relative |
| `LDI` | `LDI DR, LABEL` | Load indirect |
| `LEA` | `LEA DR, LABEL` | Load address |
| `BR` | `BRn/z/p LABEL` | Conditional branch |
| `JSR` | `JSR LABEL` | Jump to subroutine |

### TRAP Routines
- `GETC` (x20) - Read char → R0, no echo
- `OUT` (x21) - Output R0[7:0] to display
- `PUTS` (x22) - Output string (R0=address)
- `IN` (x23) - Prompt + read + echo → R0
- `HALT` (x25) - Stop execution

---

## 🚀 How to Use This Repository

### For Daily Study
1. Review core concepts in `/Core-Concepts/`
2. Practice with code templates in `/LC3-Programming/`
3. Test understanding with practice exams

### For Exam Preparation  
1. Use cheat sheets in `/Exam-Prep/` for quick review
2. Copy-paste code templates during exams
3. Reference common patterns and solutions

### For Quick Lookup
- Keep the [Quick Reference](#-quick-reference) section bookmarked
- Use code snippets during programming assignments
- Reference practice exam solutions

---

## 📝 Contributing
Feel free to add your own notes, corrections, or additional resources!

---

*Last Updated: 2024 | CEG3310/5310 Computer Organization*
