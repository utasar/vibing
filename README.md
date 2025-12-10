#!/bin/bash
# ============================================================
# LC-3 / Computer Architecture – Exam Study Guide
# Humanized Questions & Answers
# Copy-paste friendly | GitHub ready
# ============================================================


# ------------------------------------------------------------
# Question 1
# ------------------------------------------------------------
# Caches are slower than RAM but caches hold more data than RAM.
#
# Options:
#   True
#   False
#
# ✅ Correct Answer:
#   False
#
# 🧠 Explanation:
# Cache is SMALLER but FASTER than RAM. RAM holds more data.


# ------------------------------------------------------------
# Question 2
# ------------------------------------------------------------
# Stack overflows can be caused by executing a recursive
# function that does not have a base case implemented.
#
# Options:
#   True
#   False
#
# ✅ Correct Answer:
#   True
#
# 🧠 Explanation:
# Without a base case, recursion never stops and the stack
# keeps growing until memory runs out.


# ------------------------------------------------------------
# Question 3
# ------------------------------------------------------------
# Arithmetic Logic Units (ALUs) have no memory and only
# calculate arithmetic operations.
#
# Options:
#   True
#   False
#
# ✅ Correct Answer:
#   False
#
# 🧠 Explanation:
# ALUs perform arithmetic AND logic operations.
# They do not store memory, but they do more than arithmetic.


# ------------------------------------------------------------
# Question 4
# ------------------------------------------------------------
# When an interrupt is triggered, the LC-3 will always
# be put into the supervisor state.
# When returning from an interrupt, the LC-3 may return
# to user or supervisor state.
#
# Options:
#   True
#   False
#
# ✅ Correct Answer:
#   True
#
# 🧠 Explanation:
# Interrupts run in supervisor mode to protect the system.


# ------------------------------------------------------------
# Question 5
# ------------------------------------------------------------
# Which method refers to the CPU waiting and constantly
# checking if an IO device is ready?
#
# Options:
#   polling
#   recursion
#   interrupts
#   memory mapped IO
#
# ✅ Correct Answer:
#   polling
#
# 🧠 Explanation:
# Polling wastes CPU time by repeatedly checking the device.


# ------------------------------------------------------------
# Question 6
# ------------------------------------------------------------
# Which step of the instruction cycle loads the next
# instruction into the instruction register (IR)?
#
# Options:
#   evaluate address
#   fetch
#   decode
#   execute
#   store results
#
# ✅ Correct Answer:
#   fetch
#
# 🧠 Explanation:
# The FETCH stage gets the instruction from memory into IR.


# ------------------------------------------------------------
# Question 7
# ------------------------------------------------------------
# Which component converts a 5-bit number into a 16-bit number?
#
# Options:
#   A
#   B
#   C
#   D
#
# ✅ Correct Answer:
#   A
#
# 🧠 Explanation:
# Component A is a SEXT (sign extender).
# It expands smaller numbers to 16 bits.


# ------------------------------------------------------------
# Question 8
# ------------------------------------------------------------
# Which is NOT a way to improve virtual memory performance?
#
# Options:
#   add more RAM
#   use a very small page size
#   use memory efficiently
#   increase page size
#   run fewer programs
#
# ✅ Correct Answer:
#   use a very small page size
#
# 🧠 Explanation:
# Small pages increase page table overhead and slow things down.


# ------------------------------------------------------------
# Question 9
# ------------------------------------------------------------
# Explain a benefit of interrupts over polling.
#
# ✅ Answer:
# Interrupts allow the CPU to do useful work and only respond
# when needed, improving efficiency and performance.


# ------------------------------------------------------------
# Question 10
# ------------------------------------------------------------
# What is the Von Neumann model and how is it used today?
#
# ✅ Answer:
# A single memory stores both data and instructions.
# This model is still used by most modern computers.


# ------------------------------------------------------------
# Question 11
# ------------------------------------------------------------
# Given register values, what is the next value loaded
# into the highlighted register?
#
# ✅ Answer:
# x001A
#
# 🧠 Explanation:
# The instruction stores a value to memory and does NOT
# modify R0, so R0 remains x001A.


# ------------------------------------------------------------
# Question 12
# ------------------------------------------------------------
# How can all computers be built from AND, OR, and NOT?
#
# ✅ Answer:
# AND, OR, and NOT gates combine to form memory, logic,
# and arithmetic circuits. Nothing is excluded.


# ============================================================
# Question 13 – LC-3 Division using Runtime Stack
# ============================================================

.ORIG x30A9
LD R0, DIVIDEND
LD R1, DIVISOR
JSR DIVIDE
HALT

DIVIDE
ADD R6, R6, #-1
STR R7, R6, #0

ADD R2, R0, #0
ADD R3, R1, #0
BRz DIVZERO

AND R4, R4, #0

LOOP
NOT R5, R1
ADD R5, R5, #1
ADD R5, R2, R5
BRn END

ADD R2, R5, #0
ADD R4, R4, #1
BR LOOP

END
ADD R2, R4, #0
LDR R7, R6, #0
ADD R6, R6, #1
RET

DIVZERO
LD R2, MAXVAL
LDR R7, R6, #0
ADD R6, R6, #1
RET

DIVIDEND .FILL #7
DIVISOR  .FILL #3
MAXVAL   .FILL x7FFF
.FILL xF1F0
.END


# ============================================================
# Question 14 – Count Character Occurrences
# ============================================================

.ORIG x30A9
START
LEA R0, PROMPT1
PUTS
LEA R1, BUFFER
AND R2, R2, #0

READ
GETC
ADD R3, R0, #-10
BRz ASK
STR R0, R1, #0
ADD R1, R1, #1
ADD R2, R2, #1
BR READ

ASK
LEA R0, PROMPT2
PUTS
GETC
ADD R3, R0, #0
LEA R1, BUFFER
AND R4, R4, #0
AND R5, R5, #0

COUNT
NOT R6, R2
ADD R6, R6, #1
ADD R6, R5, R6
BRzp SHOW

LDR R0, R1, #0
NOT R6, R3
ADD R6, R6, #1
ADD R6, R0, R6
BRnp NEXT
ADD R4, R4, #1

NEXT
ADD R1, R1, #1
ADD R5, R5, #1
BR COUNT

SHOW
LEA R0, PROMPT3
PUTS
LD R0, ZERO
ADD R0, R0, R4
OUT
BR START

PROMPT1 .STRINGZ "Please type in ASCII characters: "
PROMPT2 .STRINGZ "Please type a character to count: "
PROMPT3 .STRINGZ "This character occurs "
ZERO    .FILL x30
BUFFER  .BLKW x64
.FILL xF1F0
.END


# ============================================================
# END OF STUDY FILE
# ============================================================
