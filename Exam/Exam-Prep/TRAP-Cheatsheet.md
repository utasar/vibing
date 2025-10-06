# 🖥️ LC3 TRAP Routines Cheat Sheet

## Essential TRAP Calls
| TRAP | Vector | Input | Output | Purpose |
|------|--------|-------|--------|---------|
| `GETC` | x20 | None | R0[7:0] = char | Read character (no echo) |
| `OUT` | x21 | R0[7:0] = char | None | Output character |
| `PUTS` | x22 | R0 = string address | None | Output string |
| `IN` | x23 | None | R0[7:0] = char | Input with prompt & echo |
| `PUTSP` | x24 | R0 = packed string addr | None | Output packed string |
| `HALT` | x25 | None | None | Stop program |

## Usage Examples
```assembly
; Read character silently
TRAP x20    ; GETC - char in R0

; Output character
AND R0, R0, #0
ADD R0, R0, #65    ; R0 = 'A'
TRAP x21           ; OUT

; Output string
LEA R0, MESSAGE    ; R0 = address of string
TRAP x22           ; PUTS

; Input with prompt
TRAP x23           ; IN - displays prompt, reads char
