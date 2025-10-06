# 🧠 LC3 Memory Addressing Modes

## Addressing Modes Comparison

| Mode | Instruction | Range | Usage |
|------|-------------|-------|--------|
| **Immediate** | `ADD R1, R1, #5` | Embedded | Constants |
| **Register** | `ADD R1, R2, R3` | Register file | Fast operations |
| **PC-Relative** | `LD R1, LABEL` | ±256 from PC | Global variables |
| **Indirect** | `LDI R1, PTR` | Full memory | Pointers |
| **Base+Offset** | `LDR R1, R2, #3` | ±32 from base | Arrays |

## Address Calculation Formulas

### PC-Relative (LD/ST/LDI/STI/LEA)


PCoffset9 = TargetAddress - (CurrentPC + 1)


## Memory Map Reference
- **x0000-x00FF:** Trap Vector Table
- **x0200-x2FFF:** Operating System
- **x3000-xFDFF:** User Program Space
- **xFE00-xFFFF:** Memory-Mapped I/O

## I/O Device Addresses
- **KBSR:** xFE00 (Keyboard Status)
- **KBDR:** xFE02 (Keyboard Data)  
- **DSR:** xFE04 (Display Status)
- **DDR:** xFE06 (Display Data)
