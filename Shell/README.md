- [x] Create a new directory called `missing` under `/tmp`.

- [x] Look up the touch program. The man program is your friend.

- [x] Use touch to create a new file called semester in missing.

  - [ ] `echo < semester` don't work, why?should be `cat < semester` or `cat semester`

- [x] Write the following into that file, one line at a time:

  ```shell
  #!/bin/sh 
  curl --head --silent https://missing.csail.mit.edu
  ```

- [x] Try to execute the file, i.e. type the path to the script (./semester) into your shell and press enter. Understand why it doesn’t work by consulting the output of ls (hint: look at the permission bits of the file).

- [x] Run the command by explicitly starting the sh interpreter, and giving it the file semester as the first argument, i.e. `sh semester`. Why does this work, while ./semester didn’t?

  - [ ] so why?https://en.wikipedia.org/wiki/Shebang_(Unix)

- [x] Look up the chmod program (e.g. use man chmod).

- [x] Use chmod to make it possible to run the command ./semester rather than having to type sh semester. How does your shell know that the file is supposed to be interpreted using sh? See this page on the shebang line for more information.

- [x] Use | and > to write the “last modified” date output by semester into a file called last-modified.txt in your home directory.

  ```shell
  $ sh semester | grep last > last-modified.txt
  $ sh semester | grep last | tee last-modified.txt
  ```

- [x] Write a command that reads out your laptop battery’s power level or your desktop machine’s CPU temperature from /sys. Note: if you’re a macOS user, your OS doesn’t have sysfs, so you can skip this exercise.

  - [x] WSL don't have /sys/class/thermal/ directory.The answer should be`cat /sys/class/thermal/thermal_zone0/temp`, result in thousands of degree of Celsius.

  