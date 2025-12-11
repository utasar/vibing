Prompt: Provide the absolute / full path to the private key name and location on YOUR system

Your current answer:

```/home/utasar/.ssh/exam_key```

This is plausible as long as:

You actually saved the key contents into a file named exam_key
And you stored it in ~/.ssh/ under your own user
Typical process on Linux/macOS:

bash
```
mkdir -p ~/.ssh
nano ~/.ssh/exam_key     # or use vim, etc., then paste the key
chmod 600 ~/.ssh/exam_key
```
That makes the absolute path:

Text
```/home/utasar/.ssh/exam_key```
So Q24 is correct if that’s where you put the file and what you named it. If on your actual system you used a different path or filename, you must use that exact absolute path instead.

Question 25
Prompt: Write the command you used to ssh to the system

Your current answer:

```ssh -i ~/.ssh/exam_key exam@3.94.30.49```

This is the correct form, assuming:

```
Key path: ~/.ssh/exam_key
Username: exam
Host: 3.94.30.49
```
To be extra explicit (absolute path instead of ~), you could also use:

bash```
ssh -i /home/utasar/.ssh/exam_key exam@3.94.30.49```
But your answer is fine.
Q25 is correct.

Question 26
Prompt: According to the README, what is your password?

You answered with a command, not the password value. The question wants the password string written as the answer.

The command to view the README after SSHing into the server is:

bash
```cat README```
If you want to do it all in one line from your local machine:

bash
```ssh -i ~/.ssh/exam_key exam@3.94.30.49 'cat README'```
But the exam question:

“According to the README, what is your password?”

wants you to read the README, then copy the password text from that file as your answer. Something like (example only):

Password123!

You need to actually SSH to the box, run cat README, look for the line that tells you “your password is …” and paste that value for Question 26.

So:

Command (just to get it): cat README
Answer to Q26: the actual password line from the README, not the command.
Question 27
Prompt: Instead of viewing the whole README file, provide a command that will only print the line with your name on it.

Your current answer:

```grep 'utasar' README```

This is a valid command if you are already in the directory with the README and your name appears exactly as utasar in that file.

If you are answering in the context of the exam (already SSH’d in and in the home dir with README), a more explicit version is:

bash
```grep 'utasar' README```
or, to allow case-insensitive search:

bash
```grep -i 'utasar' README```
Or in one shot from local:

bash
ssh -i ~/.ssh/exam_key exam@3.94.30.49 "grep 'utasar' README"
But the question only asks for a command on the server, so:

bash
```grep 'utasar' README```
is fine and correct.

Summary of what you should change
Q24: OK if that’s really where your key file is.
Q25: OK.
Q26: Replace your answer with the actual password text from the README, not a command. Use cat README or ssh ... 'cat README' to find it.
Q27: Your command grep 'utasar' README is acceptable.
