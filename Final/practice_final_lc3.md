========================================
LC-3 PRACTICE FINAL EXAM – COMPLETE REVIEW
========================================

----------------------------------------
Question 1
----------------------------------------
Adding binary numbers 16-bits and larger only requires a single full-adder.

Options:
True
False

Correct Answer:
False

Explanation:
Multi-bit addition requires multiple full adders chained together (one per bit).

----------------------------------------
Question 2
----------------------------------------
All data represented in digital computers is either a 1 or a 0.

Options:
True
False

Correct Answer:
True

Explanation:
All data is stored and processed in binary form.

----------------------------------------
Question 3
----------------------------------------
Just because something can be done in the C programming language doesn't
mean it can be done in assembly.

Options:
True
False

Correct Answer:
False

Explanation:
Anything that can be written in C can also be written in assembly
(because C is compiled to assembly).

----------------------------------------
Question 4
----------------------------------------
The 4 most significant bits of an LC-3 instruction specifies the operands.

Options:
True
False

Correct Answer:
False

Explanation:
The 4 most significant bits specify the opcode, not the operands.

----------------------------------------
Question 5
----------------------------------------
Storing data means taking data from a register and storing it in memory.
Loading data means taking data from memory and loading it into a register.

Options:
True
False

Correct Answer:
True

----------------------------------------
Question 6
----------------------------------------
R4 is a register that points to the start of the most recent frame currently
on the runtime stack.

Options:
True
False

Correct Answer:
False

Explanation:
R6 is the stack pointer. R5 is typically used as the frame pointer.

----------------------------------------
Question 7
----------------------------------------
The Fetch step of the instruction cycle loads the instruction stored at
the program counter and puts it into the instruction register.

Options:
True
False

Correct Answer:
True

----------------------------------------
Question 8
----------------------------------------
Memory mapped I/O is when I/O devices interrupt the processor to send
and receive data.

Options:
True
False

Correct Answer:
False

Explanation:
Memory-mapped I/O treats I/O devices as memory locations.

----------------------------------------
Question 9
----------------------------------------
Pseudo Ops are machine language instructions that should be executed
by the computer.

Options:
True
False

Correct Answer:
False

Explanation:
Pseudo-ops are assembler directives, not executed instructions.

----------------------------------------
Question 10
----------------------------------------
Two's Complement allows us to represent only positive numbers in binary.

Options:
True
False

Correct Answer:
False

Explanation:
Two’s complement represents both positive and negative numbers.

----------------------------------------
Question 11
----------------------------------------
Given the instruction:

ADD R0, R1, #2

What are the LC-3 control signal paths feeding into the inputs of the ALU?

Options:
A = 0000 0000 0000 0010
B = R1

A = R0
B = 0000 0000 0000 0010

A = R2
B = R0

A = R1
B = 0000 0000 0000 0010

Correct Answer:
A = R1
B = 0000 0000 0000 0010

Explanation:
The source register is R1 and the immediate value is #2.

----------------------------------------
Question 12
----------------------------------------
The ALU in a computer is specifically for

Options:
interacting with I/O
changing the PC
moving data from memory to registers
mathematical and logical calculations

Correct Answer:
mathematical and logical calculations

----------------------------------------
Question 13
----------------------------------------
When a function is getting ready to be called, the next data pushed to
the runtime stack by the caller is (if necessary)

Options:
inputs to the function
the return address of the function
the return value of the function
local variables of the function

Correct Answer:
inputs to the function

----------------------------------------
Question 14
----------------------------------------
What electrical component acts as switches that let us switch between 1's and 0's?

Options:
Capacitors
Transistors
Inductors
Resistors

Correct Answer:
Transistors

----------------------------------------
Question 15
----------------------------------------
Given the instruction:

LD R0, x005

If the instruction is stored in memory at x3000, how will data be moved?

Options:
Data at address x3006 will be loaded into R0
Data at address x3005 will be loaded into R0
Data in R0 will be stored into memory at x3006
Data in R0 will be stored into memory at x0005

Correct Answer:
Data at address x3006 will be loaded into R0

Explanation:
PC is incremented before PC-relative addressing.

----------------------------------------
Question 16
----------------------------------------
Which of the following ISN'T an operate instruction on the LC-3?

Options:
ADD
LDR
AND
NOT

Correct Answer:
LDR

----------------------------------------
Question 17
----------------------------------------
A component NOT explicitly featured in the Von Neumann model is

Options:
Central Processing Unit
Memory Unit
Graphics Processing Unit
I/O

Correct Answer:
Graphics Processing Unit

----------------------------------------
Question 18
----------------------------------------
A write-through cache will always

Options:
replace the first item when full
set a dirty bit
use fully associative mapping
store changes in memory immediately

Correct Answer:
store changes in memory immediately

----------------------------------------
Question 19
----------------------------------------
The very last instruction in a subroutine or trap service routine that
allows you to exit the routine is

Options:
RET
BRANCH
JSRR
JSR

Correct Answer:
RET

----------------------------------------
Question 20
----------------------------------------
Given:
a = 1
b = 0

The output of a(a+b)' =

Options:
a
1
2
0

Correct Answer:
0

----------------------------------------
Question 21
----------------------------------------
Write the instruction that allows for returning from an interrupt call.

Correct Answer:
RTI

----------------------------------------
Question 22
----------------------------------------
If the user presses lowercase 'a' and GETC is executed,
what is stored in R0?

Correct Answer:
x0061

----------------------------------------
Question 23
----------------------------------------
Write the LC-3 instruction that branches to LOOP when the result of

ADD R0, R1, R2

is not zero and not negative.

Correct Answer:
BRp LOOP

----------------------------------------
Question 24
----------------------------------------
If R0 = 5, write two instructions to negate R0.

Correct Answer:
NOT R0, R0
ADD R0, R0, #1

----------------------------------------
Question 25
----------------------------------------
Write the negative of 0110 1011 using 2’s complement.

Correct Answer:
1001 0101
