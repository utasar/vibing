; =========================================
; Question 27
; Check vowel vs consonant (a–z)
; Loop forever
; =========================================

.ORIG x3000

LOOP
        LEA R0, PROMPT
        PUTS

        GETC
        OUT

        ; check 'a'
        LD R1, A
        NOT R1, R1
        ADD R1, R1, #1
        ADD R1, R0, R1
        BRz VOWEL

        ; check 'e'
        LD R1, E
        NOT R1, R1
        ADD R1, R1, #1
        ADD R1, R0, R1
        BRz VOWEL

        ; check 'i'
        LD R1, I
        NOT R1, R1
        ADD R1, R1, #1
        ADD R1, R0, R1
        BRz VOWEL

        ; check 'o'
        LD R1, O
        NOT R1, R1
        ADD R1, R1, #1
        ADD R1, R0, R1
        BRz VOWEL

        ; check 'u'
        LD R1, U
        NOT R1, R1
        ADD R1, R1, #1
        ADD R1, R0, R1
        BRz VOWEL

        ; consonant
        LEA R0, CONS
        PUTS
        BR LOOP

VOWEL
        LEA R0, VOW
        PUTS
        BR LOOP

PROMPT  .STRINGZ "\nPlease enter a letter: "
VOW     .STRINGZ "The letter you entered was a vowel!\n"
CONS    .STRINGZ "The letter you entered was a consonant!\n"

A .FILL x0061
E .FILL x0065
I .FILL x0069
O .FILL x006F
U .FILL x0075

.END
