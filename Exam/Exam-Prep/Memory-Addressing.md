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
