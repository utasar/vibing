========================================
QUESTION 26 - Runtime Stack Function Call
========================================
Goal:
Pass integers 5 and 3 using the runtime stack.
Function power(x, y) computes x^y and returns result.
Store returned value at base of stack.

Equivalent C:
int main() {
    return power(5,3);
}

int power(int x, int y) {
    int result = 1;
    for(int i = 0; i < y; i++)
        result *= x;
    return result;
}

----------------------------------------
LC-3 ASSEMBLY SOLUTION
----------------------------------------

.ORIG x3000

        LD R6, STACK_TOP

        ; push y = 3
        ADD R6, R6, #-1
        AND R0, R0, #0
        ADD R0, R0, #3
        STR R0, R6, #0

        ; push x = 5
        ADD R6, R6, #-1
        AND R0, R0, #0
        ADD R0, R0, #5
        STR R0, R6, #0

        JSR POWER

        ; result now at top of stack
        HALT

POWER
        ; arguments:
        ; R6+0 = x
        ; R6+1 = y

        LDR R1, R6, #0    ; x
        LDR R2, R6, #1    ; y

        AND R3, R3, #0
        ADD R3, R3, #1    ; result = 1

POWER_LOOP
        ADD R2, R2, #0
        BRz POWER_DONE

        ADD R3, R3, R1
        ADD R2, R2, #-1
        BR POWER_LOOP

POWER_DONE
        STR R3, R6, #0    ; place result at stack base
        RET

STACK_TOP  .FILL x6000
.END
