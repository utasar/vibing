Processes & Services
Q1. State of apache2 service
Active: active (running) →
Answer: active

Q2. Least-impact command to end bob’s python3 process
python3 PID is 1998. Killing parent shells/sshd would affect more. →
Answer: kill 1998

Q3. Classify as program / process / service

a daemon that triggers validate.sh to run → service
the file / script validate.sh on the disk → program
a running instance of validate.sh → process
Mapping to given options:

program → the file / script validate.sh on the disk
process → a running instance of validate.sh
service → a daemon that triggers validate.sh to run
Q4. Which PIDs are for services? (select 2)

Services are long‑running background daemons, usually with PPID 1 in this list:

579 PPID 1 apache2 → service
1655, 1656 are apache worker processes, PPID 579 → not separate services
1773 sshd with PPID 1 is not shown in the first ps snippet, but is in the condensed tree as a top‑level daemon; that’s a service. Others (1775, 1917) are child sshd’s.
From options, the two services:

Answer: 579 and 1773

Q5. Which users are currently running an ssh session? (select 2)

Interactive ssh sessions correspond to sshd + bash for each user:

ubuntu: sshd (1890, 2158) and bash (1891, 2159) → yes
bob: sshd (1987) and bash (1988), plus python3 → yes
root, www-data, sally have no sshd-associated sessions in this listing.
Answer: ubuntu, bob

Q6. apache2 will be started at boot by systemd

Loaded: ...; enabled; means it’s enabled at boot.
Answer: True

Misc.
Q7. Sluggish VM, host has plenty of RAM/CPU

Best strategy is to give the VM more resources.
Answer: Increase the RAM and/or CPU available to the VM

Q8. Correct ssh config entry for ssh -i ~/key ksmith@wsukduncan.com

Needs hostname wsukduncan.com, user ksmith, identity file ~/key and proper keywords:

Answer:

Text
Host exam
  User ksmith
  HostName wsukduncan.com
  IdentityFile ~/key
Programming
Q9. Command to compile and link message.c to an executable

gcc message.c → compiles and links → correct
Others are only preprocessing / assembling / compiling to object.
Answer: gcc message.c
Q10. Word of the day (output of message.c)

Hex string decodes to:
The word of the day is quasi

So the word of the day is:
Answer: quasi

Q11. Make commands that would compile the program (select 3)

Targets in Makefile:

make
OP = message
SRCS = message.c

all: $(OP)

$(OP): $(SRCS)
        $(CC) $(CFLAGS) -o $(OP) $(SRCS)
So valid targets:

make → default target all → builds message
make message → directly builds message
make all → builds all, which depends on message
Others are not defined targets.
Answer: make, make message, make all

Q12. Dependency for target message

Rule: $(OP): $(SRCS) → message: message.c
Answer: message.c

Q13. Source code for compiled languages must be executable

Not required; only the compiler needs read access.
Answer: False

Q14. What should not be tracked in version control (select 2)

Should track source and history, not build artifacts:

Do track: source code, who authored changes
Do not track: compiled executable, intermediate compilation files
Answer: the compiled executable, intermediary files from the compilation process

Q15. To compile helloworld.go you need

Answer: A Go compiler

Git & GitHub
git status shows:

modified: file1.txt
new file: script.js
deleted: old_file.py
Q16. What command was used on script.js?

New tracked file →
Answer: git add script.js

Q17. Likely merge conflict caused by words.txt in docs in stuff repo

This is about the referenced repo history. In that repo, words.txt is indeed a hotspot for merge conflicts.
Answer: True

Q18. What command used on old_file.py?

Tracked file now staged as deleted →
Answer: git rm old_file.py

Q19. Commands next to get changes on remote

Staged changes need commit, then push to current branch (main):

git commit -m "changes" && git push → correct
Other options either wrong order or wrong branch.
Answer: git commit -m "changes" && git push
Q20. Clone stuff via ssh

Answer: git clone git@github.com:pattonsgirl/stuff.git

Q21. Image embed for fix.jpg in img folder from docs/test.md

Path from docs/ to img/fix.jpg is ../img/fix.jpg. Correct markdown image syntax:

Answer: ![whale](../img/fix.jpg)

Q22. Why README doesn’t render markdown

GitHub only renders markdown automatically for files with .md (or similar) extension.
Answer: File must have a .md extension

Q23. You have ability to push to the stuff repository

It’s someone else’s public repo; you don’t have push permission by default.
Answer: False

Practical (SSH / VM)
These depend on your environment; I’ll give the logical answers you’d enter:

Q24. Absolute path to your private key on your system

Example (you must answer with your actual path):

Example answer: /home/utasar/.ssh/exam_key
(Use whatever full path you actually saved that key to.)

Q25. Command used to ssh to the system

Assuming key saved at ~/.ssh/exam_key:

Answer:
ssh -i ~/.ssh/exam_key exam@3.94.30.49

(Use the actual path from Q24.)

Q26. According to the README, what is your password?

You must ssh in and read the README on the server, e.g.:

bash
ssh -i ~/.ssh/exam_key exam@3.94.30.49
cat README
Then copy the password line as the answer.

Q27. Command to print only the line with your name from README

Assuming your name is literally utasar (or whatever is used in README):

Answer (example):
grep 'utasar' README

(Replace with the exact name string appearing in the README.)

Protocols & Firewalls
Rules shown earlier:

ICMP from anywhere (0.0.0.0/0)
SSH on port 22 only from 130.108.0.0/16
(No rule shown for port 80, but questions refer to another SG screenshot for inbound.)

Q28. Any source IP can connect on port 80?

Inbound table (for that section) presumably allows HTTP from 0.0.0.0/0. Typical exam setup: yes.
Answer: True

Q29. Port used by ssh -T git@github.com

SSH uses TCP port 22.
Answer: 22

Q30. Source IP 130.108.15.32 can connect on port 22?

130.108.0.0/16 includes 130.108.15.32.
Answer: True

Q31. Port used by curl http://github.com

Plain HTTP → port 80.
Answer: 80

Q32. Port used by curl https://github.com

HTTPS → port 443.
Answer: 443

Q33. Source IP 42.91.83.108 can connect on port 22?

Only 130.108.0.0/16 is allowed for ssh; 42.91.83.108 is outside.
Answer: False

Permissions
ls -l:

Text
-rw-rw-r--  1 alice  staff   1234 Apr 29 10:15 notes.txt
drwxr-xr-x  3 alice  staff     96 Apr 29 10:20 projects
lrwxr-xr-x  1 alice  staff     11 Apr 29 10:22 hosts -> /etc/hosts
-rwxr-xr-x  1 alice  staff   2048 Apr 29 10:30 script.sh
Q34. What is hosts?

Leading l → symbolic link.
Answer: a symbolic link

Q35. Can bob edit script.sh?

script.sh perms: -rwxr-xr-x:

owner (alice): rwx
group (staff): r-x
others: r-x
bob is in staff, so group perms apply → read & execute, no write.
Answer: False

Q36. Commands to remove “others” from viewing projects without changing user/group perms (select 2)

projects currently: drwxr-xr-x (u=rwx,g=rx,o=rx)

We want to remove r and x from others only; user and group stay same:

chmod o-rx projects → changes to drwxr-x--- → correct
chmod 750 projects → also drwxr-x--- (u=rwx,g=rx,o=---) → correct
Others either affect user/group or don’t remove others’ read.
Answer: chmod 750 projects, chmod o-rx projects

Q37. Frank needs to edit notes.txt; least required privilege

notes.txt: -rw-rw-r-- alice staff
Group staff has write permission, and staff already includes alice,bob,charlie. So:

Adding frank to staff gives him write to this file and others owned by staff.
Adding to sudo is too broad.
Letting all users edit is also very broad.
“alice group” doesn’t exist separately; primary group isn’t shown as a shareable group here.
Best available choice is adding to the group that already has write:
Answer: Add frank to the staff group

Q38. Can charlie create new files in projects?

projects: drwxr-xr-x alice staff
Group staff includes charlie. Group perms: r-x (no write). So group members can’t create files.
Answer: False

Q39. Others can run script.sh

script.sh: -rwxr-xr-x → others have x.
Answer: True

Networking
ip a for enX0:

Text
inet 10.0.0.172/24 ...
Q40. Subnet mask of enX0

/24 → 255.255.255.0
Answer: 255.255.255.0

Q41. Source IP seen by xkcd.com web server

Local interface is 10.0.0.172 (private). The public IP of the VM from curl ipinfo.io is 3.94.30.49. The server on the internet sees the public IP.
Answer: 3.94.30.49

Q42. MAC address of enX0

From ip a:

Text
link/ether 16:ff:d8:d6:0c:c9
Answer: 16:ff:d8:d6:0c:c9

Q43. DNS resolves _______ to _______

Answer: hostnames to ip addresses (and vice versa)

Q44. IPv4 address of enX0

From ip a:

Text
inet 10.0.0.172/24 ...
Answer: 10.0.0.172

Bonus
Q45. Explain pwgen -N 10 -y -1

Typical pwgen options:

-N 10 → generate 10 passwords
-y → include at least one special symbol (non‑alphanumeric) in each password
-1 → print one password per line
So:

Answer (summary):
It runs pwgen to generate 10 passwords, each printed on its own line, and each containing at least one special character.

Scripting & Commands
Script validate.sh:

bash
pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
...
if [[ "$input" =~ $pattern ]]; then
    echo "✅ Valid input: '$input'"
else
    echo "❌ Invalid input: '$input'"
fi
Q46. Provide a NON‑match to the regex pattern

Pattern matches email addresses. Any non-email string works.

Example answer: hello world

Q47. Provide a match to the regex pattern

A valid email address.

Example answer: user.name+1@example-domain.com

Q48. Running:

bash
bash validate.sh -s
# OR
bash validate.sh -n
Will print usage & exit?

bash validate.sh -s → -s requires an argument; getopts will treat it as missing and fall into usage or leave input empty. In either case, script calls usage and exits.
-n is an invalid option, triggers *) usage ;; branch.
So yes, both will print usage and exit.
Answer: True

Q49. Steps so any user can run validate by name (select 3)

To run validate as a command:

The directory containing it must be in PATH.
The file must be executable by all users that should run it.
The filename used at command prompt must be validate (or you must call validate.sh; question explicitly says run "validate").
Thus:

the directory the script is located in must be added to the PATH environment variable → yes
the script must be renamed from validate.sh to validate → yes (for the exact validate command)
all users must be able to execute the script file → yes
Other options are unnecessary/wrong.
Answer:

the directory the script is located in must be added to the PATH environment variable
the script must be renamed from validate.sh to validate
all users must be able to execute the script file
Q50. Running:

bash
bash validate.sh -s ohio -p '^[\w].*[\d]?'
Pattern '^[\w].*[\d]?' means:

Starts with a word character
Followed by any chars
Optionally ends with a digit
"ohio":

Starts with a word char (o)
.* matches hio
[\d]? can match “no digit” at end, which is allowed, so the whole string matches.
So the if [[ "$input" =~ $pattern ]] evaluates to true.
Answer: True
