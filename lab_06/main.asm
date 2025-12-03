.ORIG x3000

;;;;;; PTR SETUP ;;;;;;
LD R6, STACK_PTR
LD R4, GLOBAL_VARS_PTR  ; Needed due to vars being out of scope

LD R0, CHAR_A
STR R0, R4, #0
ADD R4, R4, #-1
LD R0, CHAR_P
STR R0, R4, #0
ADD R4, R4, #-1
LD R0, CHAR_Q
STR R0, R4, #0
ADD R4, R4, #-1
LD R0, CHAR_R
STR R0, R4, #0
ADD R4, R4, #-1
LD R0, CHAR_S
STR R0, R4, #0
ADD R4, R4, #-1
LEA R0, STR_1
STR R0, R4, #0
ADD R4, R4, #-1
LEA R0, STR_2
STR R0, R4, #0
ADD R4, R4, #-1
LEA R0, STR_3
STR R0, R4, #0
ADD R4, R4, #-1
LEA R0, STR_NL
STR R0, R4, #0
;;;;;;;;;;;;;;;;;;;;;;;

BRnzp MAIN

STACK_PTR .FILL x6000
GLOBAL_VARS_PTR .FILL x4500

CHAR_A .FILL #97
CHAR_P .FILL #112
CHAR_Q .FILL #113
CHAR_R .FILL #114
CHAR_S .FILL #115

STR_1 .STRINGZ "Available options:\np - Print linked list\na - Add value to linked list\nr - Remove value from linked list\nq - Quit\nChoose an option: "
STR_2 .STRINGZ "Type a number to add: "
STR_3 .STRINGZ "Type a number to remove: "
STR_NL .STRINGZ "\n"

MAIN
    ;;;;;; Setup ;;;;;;
        ADD R6, R6, #-1 ;x5FFF
        STR R7, R6, #0

        ADD R6, R6, #-1 ; x5FFE
        STR R5, R6, #0

        ; Set frame ptr
        ADD R5, R6, #0
    ;;;;;;;;;;;;;;;;;;;

    ; node_t *head;
    ADD R6, R6, #-1     ; x5FFD
    AND R0, R0, #0
    STR R0, R6, #0

    ; char selection = 's';     // 's' = 115
    ADD R6, R6, #-1     ; x5FFC
    LD R0, CHAR_S
    STR R0, R6, #0

    ;;;;;; while(selection != 'q') ;;;;;;
    WHILE_NOT_Q
        ;;; PRINT OPTIONS ;;;
        LDR R0, R4, #3  ; STR_1
        PUTS
        
        ;;; GET_INPUT ;;;
        GETC
        OUT
        STR R0, R6, #0  ; x5FFC
        LDR R0, R4, #0  ; STR_NL
        PUTS

        IF_P
            LDR R0, R6, #0
            LDR R1, R4, #7  ; CHAR_P
            NOT R1, R1
            ADD R1, R1, #1
            ADD R1, R0, R1
            BRnp ELSE_IF_A

                ADD R6, R6, #-1 ; **head
                ADD R0, R6, #2
                STR R0, R6, #0
                JSR PRINT_LIST
                ADD R6, R6, #1  ; pop head param

            BRnzp CONTINUE
        ELSE_IF_A
            LDR R0, R6, #0
            LDR R1, R4, #8  ; CHAR_A
            NOT R1, R1
            ADD R1, R1, #1
            ADD R1, R0, R1
            BRnp ELSE_IF_R

            ADD R6, R6, #-1 ; input number

            LDR R0, R4, #2  ; STR_2
            PUTS
        
            TRAP x40
            TRAP x41
            STR R0, R6, #0  ; x5FFB

            LDR R0, R4, #0  ; STR_NL
            PUTS

            ADD R6, R6, #-1 ; x5FFA
            ADD R0, R6, #3  ; **head - x5FFD
            STR R0, R6, #0

            ADD R6, R6, #-1 ; x5FF9
            LDR R0, R6, #2  ; input num
            STR R0, R6, #0
            JSR ADD_VALUE
            ADD R6, R6, #3  ; x5FFC

            BRnzp CONTINUE
        ELSE_IF_R
            LDR R0, R6, #0
            LDR R1, R4, #5  ; CHAR_R
            NOT R1, R1
            ADD R1, R1, #1
            ADD R1, R0, R1
            BRnp ELSE_IF_Q

            LDR R0, R4, #1  ; STR_3
            PUTS

            ADD R6, R6, #-1 ; x5FFB
            ADD R0, R6, #2
            STR R0, R6, #0

            TRAP x40
            TRAP x41
            ADD R6, R6, #-1
            STR R0, R6, #0  ; int input

            JSR REMOVE_VALUE
            
            ADD R6, R6, #2
            BRnzp CONTINUE
        ELSE_IF_Q
            LDR R0, R6, #0
            LDR R1, R4, #6  ; CHAR_Q
            NOT R1, R1
            ADD R1, R1, #1
            ADD R1, R0, R1
            BRnp WHILE_NOT_Q
            
            JSR BREAK

            LDR R0, R4, #0  ; STR_NL
            PUTS
            BRnzp CONTINUE
        CONTINUE
            LDR R0, R4, #0  ; STR_NL
            PUTS
            BRnzp WHILE_NOT_Q
    BREAK
HALT

;;; void printList ;;;
; params node_t **head
;;;;;;;;;;;;;;;;;;;;;;
PRINT_LIST
    ADD R6, R6, #-1
    STR R7, R6, #0	; return address (R7)

    ADD R6, R6, #-1
    STR R5, R6, #0	; previous frame pointer (R5)
    ADD R5, R6, #0  ; set frame pointer

    ; if (*head == NULL)
    LDR R0, R5, #2  ; *head
    LDR R0, R0, #0  ; &head
    BRz EMPTY
    BRnzp PRINT

    EMPTY
        LEA R0, STR_EMPTY
        PUTS
        BRnzp RETURN_PRINT_LIST

    PRINT
        ADD R6, R6, #-1
        STR R0, R6, #0

        LEA R0, STR_CONTENTS
        PUTS

        LDR R0, R6, #0  ; x####
        LDR R0, R0, #0  ; int
        TRAP x41

        ; Load next
        LDR R0, R6, #0  ; *next
        ADD R0, R0, #1  ; x#### + 1
        STR R0, R6, #0

        PRINT_LOOP
            LDR R0, R6, #0
            LDR R0, R0, #0
            BRz BREAK_PRINT
            STR R0, R6, #0

            LEA R0, STR_PTR
            PUTS

            LDR R0, R6, #0  ; x#### <- x#### + 1
            LDR R0, R0, #0  ; int
            TRAP x41
            LDR R0, R6, #0
            ADD R0, R0, #1  ; *next
            STR R0, R6, #0
            BRnzp PRINT_LOOP

        BREAK_PRINT
            ADD R6, R6, #1

    RETURN_PRINT_LIST
        LDR R5, R6, #0
        ADD R6, R6, #1

        LDR R7, R6, #0
        ADD R6, R6, #1
RET

STR_EMPTY .STRINGZ "The list is empty.\n"
STR_CONTENTS .STRINGZ "List contents:\n"
STR_PTR .STRINGZ  " -> "

;;; void addValue ;;;
; params node_t **head [x5FFA], int added [x5FF9]
;;;;;;;;;;;;;;;;;;;;;
ADD_VALUE           ; x5FF9
    ADD R6, R6, #-1 ; x5FF8
    STR R7, R6, #0	; return address (R7)

    ADD R6, R6, #-1 ; x5FF7
    STR R5, R6, #0	; previous frame pointer (R5)
    ADD R5, R6, #0  ; set frame pointer

    ST R1, ADD_STR_R1

    LDR R0, R5, #3  ; x5FFA
    LDR R0, R0, #0

    BRnp ADD_NUM

    ; else, *head == NULL
        LD R0, LIST_BASE    ; x8000

        LDR R1, R5, #3      ; x5FFD <- x5FFA

        STR R0, R1, #0      ; x8000 -> x5FFD

        LDR R0, R6, #3      ; x5FFD <- x5FFA
        LDR R0, R0, #0      ; x8000 <- x5FFD
        LDR R1, R6, #2      ; int added
        STR R1, R0, #0      ; int -> x8000

        AND R1, R1, #0      ; x0
        STR R1, R0, #1      ; x8001
        BRnzp RETURN_ADD_VALUE

    ADD_NUM
        ADD R6, R6, #-1
        LDR R0, R5, #3      ; x5FFD <- x5FFA
        LDR R0, R0, #0      ; x8000 <- x5FFD
        STR R0, R6, #0      ; *head -> current;

        WHILE_NULL
            LDR R0, R6, #0  ; x####                 ; x8000
            ADD R0, R0, #1  ; x#### + 1             ; x8001
            LDR R0, R0, #0  ; *next <- x#### + 1    ; null || x8002 <- x8001
            BRz BREAK_WHILE_NULL

            STR R0, R6, #0  ; current = current->next

            BRnzp WHILE_NULL

        BREAK_WHILE_NULL
            LDR R0, R6, #0

            LDR R1, R6, #0 
            ADD R1, R1, #2  ; x#### + 2 -> next

            STR R1, R0, #1

            LDR R1, R5, #2  ; input, x5FF9
            STR R1, R0, #2  ; next <- input

            AND R1, R1, #0
            STR R1, R0, #3

            ADD R6, R6, #1  ; pop current
            BRnzp RETURN_ADD_VALUE

    RETURN_ADD_VALUE
        LD R1, ADD_STR_R1
        LDR R5, R6, #0
        ADD R6, R6, #1

        LDR R7, R6, #0
        ADD R6, R6, #1
RET

ADD_STR_R1 .BLKW #1

;;; void removeValue ;;;
; params node_t **head, int removed
;;;;;;;;;;;;;;;;;;;;;;;;
REMOVE_VALUE
    ADD R6, R6, #-1
    STR R7, R6, #0	; return address (R7)

    ADD R6, R6, #-1
    STR R5, R6, #0	; previous frame pointer (R5)
    ADD R5, R6, #0  ; set frame pointer

    ST R1, REMOVE_STR_R1

    ADD R6, R6, #-1
    LDR R0, R5, #3  ; ptr
    LDR R0, R0, #0  ; head
    STR R0, R6, #0  ; current = head

    ; if head == removed
    LDR R0, R6, #0  ; current
    LDR R0, R0, #0  ; value
    LDR R1, R5, #2  ; removed
    NOT R1, R1
    ADD R1, R1, #1
    ADD R1, R0, R1
    BRz IF_HEAD_IS_REMOVED


    ADD R6, R6, #-1
    AND R0, R0, #0
    STR R0, R6, #0  ; prev = NULL
    BRnzp WHILE_NOT_EQUAL

    IF_HEAD_IS_REMOVED
        LDR R0, R6, #0  ; head
        ADD R0, R0, #1  ; head->next
        LDR R0, R0, #0  ; next
        BRz SET_NULL

        LDR R0, R6, #4  ; ptr    
        LDR R0, R0, #0  ; head
        ADD R0, R0, #1  ; head->next
        LDR R0, R0, #0
        LDR R1, R6, #4
        STR R0, R1, #0

        ADD R6, R6, #1
        BRnzp REMOVE_VALUE_RETURN

        SET_NULL
            LDR R0, R6, #4  ; head
            AND R1, R1, #0
            STR R1, R0, #0
            ADD R6, R6, #1
            BRnzp REMOVE_VALUE_RETURN

    WHILE_NOT_EQUAL
        LDR R0, R6, #1  ; current
        LDR R0, R0, #0  ; data
        
        LDR R1, R5, #2  ; removed
        NOT R1, R1
        ADD R1, R1, #1
        ADD R1, R0, R1  ; data - removed
        BRz POP

        ; next is null?
        LDR R0, R6, #1  ; current
        ADD R0, R0, #1  ; current->next
        LDR R0, R0, #0  ; next
        BRz BREAK_WHILE_NOT_EQUAL

        LDR R0, R6, #1 
        STR R0, R6, #0  ; prev = current
        ; next
        LDR R0, R6, #1  ; current
        ADD R0, R0, #1  ; current->next
        LDR R0, R0, #0  ; next
        STR R0, R6, #1  ; current = next

        BRnzp WHILE_NOT_EQUAL
    BREAK_WHILE_NOT_EQUAL
        ADD R6, R6, #2
        BRnzp REMOVE_VALUE_RETURN
    
    POP
        LDR R0, R6, #1  ; current
        ADD R0, R0, #1  ; current->next
        LDR R0, R0, #0  ; next
        LDR R1, R6, #0  ; prev
        ADD R1, R1, #1  ; prev->next
        STR R0, R1, #0
        ADD R6, R6, #2

        BRnzp REMOVE_VALUE_RETURN

    REMOVE_VALUE_RETURN
        LD R1, REMOVE_STR_R1
        LDR R5, R6, #0
        ADD R6, R6, #1

        LDR R7, R6, #0
        ADD R6, R6, #1
RET

LIST_BASE .FILL x8000
REMOVE_STR_R1 .BLKW #1

.END
