# Final Exam Coding Questions:

## 26.
Write an LC3 assembly program that will read a single lowercase character input from the keyboard (a - z) and print it to the display, looping until the user hits the "Enter" key.

After the user hits the "Enter" key, the program should then display a message saying "You entered: ", as well as ALL of the characters entered converted to UPPERCASE. For example, if the user hit the enter key after typing in "atqm" the program should show:
```
atqm
You entered: ATQM
```

Lastly, the program should loop indefinitely, so the user can enter in multiple combinations of characters. Here is an example output:
```
atqm
You entered: ATQM
abcdefg
You entered: ABCDEFG
zzzzzz
You entered: ZZZZZZ
```

## 27.
Write an LC3 assembly program that will prompt the user to enter a single digit number 0 to 9 (inclusive). You can expect the user will always enter a single digit number that is between 0 and 9.

Next, based on the user input print the following to the display:

1. If user's input was less than 5 print:
   The number you entered was less than 5!
2. If user's input was equal to 5 print:
   The number you entered was equal to 5!
3. If user's input was greater than 5 print:
   The number you entered was greater than 5!

Lastly, the program should loop indefinitely allowing the user to type in a single digit number as many times as they want.

Here is an example of the program running using all acceptable inputs:
```
Please enter a number: 0
The number you entered was less than 5!

Please enter a number: 1
The number you entered was less than 5!

Please enter a number: 2
The number you entered was less than 5!

Please enter a number: 3
The number you entered was less than 5!

Please enter a number: 4
The number you entered was less than 5!

Please enter a number: 5
The number you entered was equal to 5!

Please enter a number: 6
The number you entered was greater than 5!

Please enter a number: 7
The number you entered was greater than 5!

Please enter a number: 8
The number you entered was greater than 5!

Please enter a number: 9
The number you entered was greater than 5!
```
