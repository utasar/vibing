    .ORIG x3000

LOOP
    LEA R0, STRING1
    PUTS

    GETC
    OUT

    LD R3, OFFSET
    ADD R1, R0, R3
    BRn LESS
    BRz EQUAL
    BRp GREATER

LESS
    LEA R0, STRING2
    PUTS
    BR LOOP

EQUAL
    LEA R0, STRING3
    PUTS
    BR LOOP

GREATER
    LEA R0, STRING4
    PUTS
    BR LOOP  

STRING1 .STRINGZ    "Please enter a number: "
STRING2 .STRINGZ    "\nThe number you entered was less than 5!\n"
STRING3 .STRINGZ    "\nThe number you entered was equal to 5!\n"
STRING4 .STRINGZ    "\nThe number you entered was greater than 5!\n"
OFFSET  .FILL       #-53

    .END
