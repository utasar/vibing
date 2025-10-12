
3 is equal to 3<img width="732" height="443" alt="image" src="https://github.com/user-attachments/assets/b35146f1-c40a-42fa-8db7-87c540cbed54" />



**Question 7**
.ORIG x3000
        
; Main loop - process multiple strings
MAIN    LEA R0, PROMPT      ; Load address of prompt message
        PUTS                ; Display "Please enter a string: "
        
        ; Read string from user
        LEA R1, BUFFER      ; R1 points to buffer to store input
        LD R2, MAXLEN       ; R2 = max length (9)
        
INPUT   GETC                ; Get character from keyboard
        OUT                 ; Echo character to display
        
        ; Check for newline (Enter key)
        LD R3, NEWLINE
        ADD R3, R0, R3      ; Compare with newline
        BRz PROCESS         ; If newline, process the string
        
        ; Store character in buffer
        STR R0, R1, #0      ; Store character at current position
        ADD R1, R1, #1      ; Move to next position
        ADD R2, R2, #-1     ; Decrement counter
        BRp INPUT           ; Continue if space remains
        
        ; If buffer full, still wait for newline
WAIT    GETC
        OUT
        LD R3, NEWLINE
        ADD R3, R0, R3
        BRnp WAIT
        
        ; Process the string - count uppercase letters
PROCESS AND R4, R4, #0      ; R4 = counter = 0
        LEA R1, BUFFER      ; R1 points to start of buffer
        
LOOP    LDR R0, R1, #0      ; Load character from buffer
        BRz DONE            ; If null terminator, done
        
        ; Check if uppercase (A-Z is x41-x5A or 65-90)
        LD R3, NEG_A        ; R3 = -65 (negative of 'A')
        ADD R3, R0, R3      ; R3 = char - 65
        BRn NEXT            ; If < 'A', not uppercase
        
        LD R3, NEG_Z        ; R3 = -90 (negative of 'Z')
        ADD R3, R0, R3      ; R3 = char - 90
        BRp NEXT            ; If > 'Z', not uppercase
        
        ; Character is uppercase
        ADD R4, R4, #1      ; Increment counter
        
NEXT    ADD R1, R1, #1      ; Move to next character
        BRnzp LOOP          ; Continue loop
        
        ; Display result
DONE    LEA R0, RESULT      ; Load address of result message
        PUTS                ; Display "Uppercase count: "
        
        ; Convert count to ASCII and display
        AND R0, R0, #0
        ADD R0, R4, R0      ; R0 = count
        LD R1, ASCII_OFF    ; R1 = 48 (ASCII '0')
        ADD R0, R0, R1      ; Convert to ASCII
        OUT                 ; Display count
        
        LD R0, NEWLINE_CHAR ; Load newline character
        OUT                 ; Print newline
        
        ; Clear buffer for next iteration
        LEA R1, BUFFER
        AND R0, R0, #0
CLEAR   STR R0, R1, #0
        ADD R1, R1, #1
        LD R2, MAXLEN
        ADD R2, R2, #1
        ADD R1, R1, R2
        LEA R2, BUFFER
        ADD R2, R2, #10
        NOT R2, R2
        ADD R2, R2, #1
        ADD R2, R1, R2
        BRn CLEAR
        
        BRnzp MAIN          ; Repeat for next string
        
; Data
PROMPT      .STRINGZ "Please enter a string: "
RESULT      .STRINGZ "Uppercase count: "
BUFFER      .BLKW 10        ; Buffer for input (9 chars + null)
MAXLEN      .FILL #9
NEWLINE     .FILL #-10      ; Negative of newline (x0A)
NEWLINE_CHAR .FILL #10      ; Newline character for output
NEG_A       .FILL #-65      ; Negative of 'A' (x41)
NEG_Z       .FILL #-90      ; Negative of 'Z' (x5A)
ASCII_OFF   .FILL #48       ; ASCII offset ('0')

        .END


**Question 8**

.ORIG x3000

MAIN    LEA R0, PROMPT1         ; Load address of first prompt
        PUTS                    ; Display "Please enter first digit: "
        
        GETC                    ; Read first digit from user
        OUT                     ; Echo the character
        
        LD R1, ASCII_OFFSET     ; Load -48 to convert ASCII to integer
        ADD R2, R0, R1          ; R2 = first digit as integer
        
        LD R0, NEWLINE          ; Load newline character
        OUT                     ; Print newline
        
        LEA R0, PROMPT2         ; Load address of second prompt
        PUTS                    ; Display "Please enter second digit: "
        
        GETC                    ; Read second digit from user
        OUT                     ; Echo the character
        
        LD R1, ASCII_OFFSET     ; Load -48 to convert ASCII to integer
        ADD R3, R0, R1          ; R3 = second digit as integer
        
        LD R0, NEWLINE          ; Load newline character
        OUT                     ; Print newline
        
        ; Compare the two numbers
        NOT R4, R3              ; R4 = NOT(R3)
        ADD R4, R4, #1          ; R4 = -R3 (two's complement)
        ADD R4, R2, R4          ; R4 = R2 - R3
        
        BRn LESS_THAN           ; If negative, first < second
        BRz EQUAL               ; If zero, first == second
        BRp GREATER_THAN        ; If positive, first > second

LESS_THAN
        ADD R0, R2, #0          ; Move first digit to R0
        LD R1, ASCII_OFFSET     ; Load -48
        NOT R1, R1              ; NOT(-48) = 47
        ADD R1, R1, #1          ; 47 + 1 = 48
        ADD R0, R0, R1          ; Convert to ASCII
        OUT                     ; Print first digit
        
        LEA R0, MSG_LESS        ; Load " is less than "
        PUTS
        
        ADD R0, R3, #0          ; Move second digit to R0
        LD R1, ASCII_OFFSET     ; Load -48
        NOT R1, R1              ; Convert back to positive
        ADD R1, R1, #1
        ADD R0, R0, R1          ; Convert to ASCII
        OUT                     ; Print second digit
        
        LD R0, NEWLINE
        OUT
        BR MAIN                 ; Loop back to start

GREATER_THAN
        ADD R0, R2, #0          ; Move first digit to R0
        LD R1, ASCII_OFFSET
        NOT R1, R1
        ADD R1, R1, #1
        ADD R0, R0, R1          ; Convert to ASCII
        OUT
        
        LEA R0, MSG_GREATER     ; Load " is greater than "
        PUTS
        
        ADD R0, R3, #0          ; Move second digit to R0
        LD R1, ASCII_OFFSET
        NOT R1, R1
        ADD R1, R1, #1
        ADD R0, R0, R1          ; Convert to ASCII
        OUT
        
        LD R0, NEWLINE
        OUT
        BR MAIN                 ; Loop back to start

EQUAL   ADD R0, R2, #0          ; Move first digit to R0
        LD R1, ASCII_OFFSET
        NOT R1, R1
        ADD R1, R1, #1
        ADD R0, R0, R1          ; Convert to ASCII
        OUT
        
        LEA R0, MSG_EQUAL       ; Load " is equal to "
        PUTS
        
        ADD R0, R3, #0          ; Move second digit to R0
        LD R1, ASCII_OFFSET
        NOT R1, R1
        ADD R1, R1, #1
        ADD R0, R0, R1          ; Convert to ASCII
        OUT
        
        LD R0, NEWLINE
        OUT
        BR MAIN                 ; Loop back to start

; Data section
PROMPT1         .STRINGZ "Please enter first digit: "
PROMPT2         .STRINGZ "Please enter second digit: "
MSG_LESS        .STRINGZ " is less than "
MSG_GREATER     .STRINGZ " is greater than "
MSG_EQUAL       .STRINGZ " is equal to "
ASCII_OFFSET    .FILL #-48      ; To convert ASCII '0'-'9' to 0-9
NEWLINE         .FILL x000A     ; Newline character

                .END

