#!/bin/bash
# =========================================
# Practice Final Exam 2 – LC-3 / Architecture
# Study Version (Questions, Options, Answers)
# =========================================

# -----------------------------------------
# Question 1
# The Random cache replacement algorithm is typically very
# expensive to implement because most computers do not have
# random number generators already built into the architecture.
#
# A) True
# B) False
#
# Correct Answer: B) False
# -----------------------------------------


# -----------------------------------------
# Question 2
# The only interrupt on the LC3 is the keyboard interrupt.
#
# A) True
# B) False
#
# Correct Answer: A) True
# -----------------------------------------


# -----------------------------------------
# Question 3
# In C, typically a char or an int is used for boolean values.
#
# A) True
# B) False
#
# Correct Answer: A) True
# -----------------------------------------


# -----------------------------------------
# Question 4
# Understanding assembly is important in understanding efficiency
# or performance of your programs.
#
# A) True
# B) False
#
# Correct Answer: A) True
# -----------------------------------------


# -----------------------------------------
# Question 5
# On the LC3 during the fetch step of the instruction cycle, the
# program counter gets incremented by 1 after fetching the instruction.
#
# A) True
# B) False
#
# Correct Answer: A) True
# -----------------------------------------


# -----------------------------------------
# Question 6
# Memory is one of the core components of the Von Neumann Model.
#
# A) True
# B) False
#
# Correct Answer: A) True
# -----------------------------------------


# -----------------------------------------
# Question 7
# A callee save is when a subroutine saves register values before
# calling another subroutine.
#
# A) True
# B) False
#
# Correct Answer: B) False
# (Caller save happens before calling another subroutine)
# -----------------------------------------


# -----------------------------------------
# Question 8
# A stack overflow can occur if we push too much data onto the stack.
#
# A) True
# B) False
#
# Correct Answer: A) True
# -----------------------------------------


# -----------------------------------------
# Question 9
# If an operand is "immediate" that means it is inside of the instruction.
#
# A) True
# B) False
#
# Correct Answer: A) True
# -----------------------------------------


# -----------------------------------------
# Question 10
# Polling means the CPU gets interrupted whenever I/O needs to be handled.
#
# A) True
# B) False
#
# Correct Answer: B) False
# (Polling means the CPU repeatedly checks device status)
# -----------------------------------------


# -----------------------------------------
# Question 11
# When popping from an empty stack, this error can occur.
#
# A) stack underflow
# B) privilege exception
# C) null pointer
# D) stack overflow
#
# Correct Answer: A) stack underflow
# -----------------------------------------


# -----------------------------------------
# Question 12
# Given the logic gate shown in the exam:
# What is Y if A = 1 and B = 0?
#
# A) Y = 2
# B) Y = 1
# C) Y = VDD
# D) Y = 0
#
# Correct Answer: D) Y = 0
# -----------------------------------------


# -----------------------------------------
# Question 13
# This TRAP service routine stops the processor from executing.
#
# A) RET
# B) END
# C) STOP
# D) HALT
#
# Correct Answer: D) HALT
# -----------------------------------------


# -----------------------------------------
# Question 14
# This memory address is used to access the keyboard status register.
#
# A) the keyboard is not accessed from memory
# B) xFE00
# C) xFE02
# D) xFE04
#
# Correct Answer: B) xFE00
# -----------------------------------------


# -----------------------------------------
# Question 15
# In recursion, if you don't implement the base case:
#
# A) more memory will be allocated to prevent stack overflow
# B) you can corrupt memory your instructions occupy
# C) runtime stack resets
# D) program returns incorrect value
#
# Correct Answer: B) you can corrupt memory your instructions occupy
# -----------------------------------------


# -----------------------------------------
# Question 16
# The LD.CC signal on the LC3 controls:
#
# A) loading instruction into IR
# B) loading new value into PC
# C) loading value into registers
# D) loading the NZP bits
#
# Correct Answer: D) loading the NZP bits
# -----------------------------------------


# -----------------------------------------
# Question 17
# 45 in binary is:
#
# A) 1101 0010
# B) 0010 1101
# C) 0x2D
# D) 1111 1111 0010 1101
#
# Correct Answer: B) 0010 1101
# -----------------------------------------


# -----------------------------------------
# Question 18
# Which is NOT a method of improving virtual memory performance?
#
# A) decreasing swap size
# B) running fewer programs
# C) adding more RAM
# D) writing memory-efficient programs
#
# Correct Answer: A) decreasing swap size
# -----------------------------------------


# -----------------------------------------
# Question 19
# What is NOT pushed onto the runtime stack by the callee?
#
# A) frame pointer
# B) return value
# C) input parameters
# D) return address
#
# Correct Answer: C) input parameters
# -----------------------------------------


# -----------------------------------------
# Question 20
# Interrupts can be used for:
#
# A) errors
# B) user events
# C) OS system events
# D) all of the above
#
# Correct Answer: D) all of the above
# -----------------------------------------


# -----------------------------------------
# Question 21
# Write an LC3 instruction that calls a trap service routine
# whose address is stored at x0050.
#
# Correct Answer:
# TRAP x50
# -----------------------------------------


# -----------------------------------------
# Question 22
# Explain the purpose of a CPU cache.
#
# Correct Answer:
# A CPU cache is a small, fast memory that stores frequently used data
# to reduce access time. It sits between the CPU and RAM to avoid slow
# memory accesses.
# -----------------------------------------


# -----------------------------------------
# Question 23
# Explain the purpose of the runtime stack.
#
# Correct Answer:
# The runtime stack stores function parameters, return addresses,
# and local variables. It allows recursion and multiple function calls
# without overwriting memory or registers.
# -----------------------------------------


# -----------------------------------------
# Question 24
# Can recursion be implemented without a runtime stack?
#
# Correct Answer:
# A recursive subroutine cannot be safely implemented without a runtime
# stack because each call must preserve its own state.
# -----------------------------------------


# -----------------------------------------
# Question 25
# Write 4 LC3 instructions to enable keyboard interrupts.
#
# Correct Answer:
#
# LD   R0, KBSR
# LD   R1, MASK
# STR  R1, R0, #0
#
# KBSR .FILL xFE00
# MASK .FILL x4000
# -----------------------------------------


# -----------------------------------------
# Question 26 and 27
# (Full LC3 programs should be placed in separate .asm files)
# Recommended filenames:
#
# volume_function.asm
# vowel_consonant.asm
# -----------------------------------------
