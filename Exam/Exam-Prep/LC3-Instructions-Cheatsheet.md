# 🔧 LC3 Instruction Set Cheat Sheet

## Operate Instructions
| Instruction | Format | Example | Purpose |
|-------------|--------|---------|---------|
| `ADD` | `ADD DR, SR1, SR2` | `ADD R1, R2, R3` | R1 = R2 + R3 |
| `ADD` | `ADD DR, SR1, imm5` | `ADD R1, R2, #5` | R1 = R2 + 5 |
| `AND` | `AND DR, SR1, SR2` | `AND R1, R2, R3` | R1 = R2 & R3 |
| `AND` | `AND DR, SR1, imm5` | `AND R1, R2, #5` | R1 = R2 & 5 |
| `NOT` | `NOT DR, SR` | `NOT R1, R2` | R1 = ~R2 |

## Data Movement
| Instruction | Format | Example | Purpose |
|-------------|--------|---------|---------|
| `LD` | `LD DR, LABEL` | `LD R1, VAR` | R1 = mem[VAR] |
| `LDR` | `LDR DR, BaseR, offset6` | `LDR R1, R2, #3` | R1 = mem[R2+3] |
| `LDI` | `LDI DR, LABEL` | `LDI R1, PTR` | R1 = mem[mem[PTR]] |
| `LEA` | `LEA DR, LABEL` | `LEA R1, VAR` | R1 = address of VAR |
| `ST` | `ST SR, LABEL` | `ST R1, VAR` | mem[VAR] = R1 |
| `STR` | `STR SR, BaseR, offset6` | `STR R1, R2, #3` | mem[R2+3] = R1 |
| `STI` | `STI SR, LABEL` | `STI R1, PTR` | mem[mem[PTR]] = R1 |

## Control Instructions
| Instruction | Format | Example | Purpose |
|-------------|--------|---------|---------|
| `BR` | `BRn/z/p LABEL` | `BRn LOOP` | Branch if negative |
| `JMP` | `JMP BaseR` | `JMP R7` | PC = BaseR |
| `JSR` | `JSR LABEL` | `JSR SUB` | Call subroutine |
| `JSRR` | `JSRR BaseR` | `JSRR R1` | Call subroutine (register) |
| `RET` | `RET` | `RET` | Return (JMP R7) |
| `TRAP` | `TRAP trapvect8` | `TRAP x21` | System call |
| `RTI` | `RTI` | `RTI` | Return from interrupt |
