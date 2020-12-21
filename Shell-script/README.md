https://missing.csail.mit.edu/2020/shell-tools/

- [x] `tldr` instead of `man`,tldr means TOO LONG;DON'T READ from internet slang. 

- [x] using `#!/usr/local/env python` instead of `#!/usr/local/bin/python` for a better portablility.

- [x]  it is important that you know that these problems can be quickly solved using one of these tools, **while the specific tools you use are not as important**.

- [x] Read [`man ls`](https://www.man7.org/linux/man-pages/man1/ls.1.html) and write an `ls` command that lists files in the following manner

  - Includes all files, including hidden files
  - Sizes are listed in human readable format (e.g. 454M instead of 454279954)
  - Files are ordered by recency
  - Output is colorized

  ```shell
  $ ls --color -lath
  total 0
  -rwxrwxrwx 1 litang litang    0 Dec 21 11:00 cc
  drwxrwxrwx 1 litang litang 4.0K Dec 21 11:00 .
  -rwxrwxrwx 1 litang litang    0 Dec 21 11:00 ba
  -rwxrwxrwx 1 litang litang    0 Dec 21 11:00 a
  -rwxrwxrwx 1 litang litang    0 Dec 21 09:53 README.md
  drwxrwxrwx 1 litang litang 4.0K Dec 21 09:53 ..
  ```

- [x] Write bash functions `marco` and `polo` that do the following. Whenever you execute `marco` the current working directory should be saved in some manner, then when you execute `polo`, no matter what directory you are in, `polo` should `cd` you back to the directory where you executed `marco`. For ease of debugging you can write the code in a file `marco.sh` and (re)load the definitions to your shell by executing `source marco.sh`.

  > https://www.cnblogs.com/fhefh/archive/2011/04/17/2019103.html

  my two script:

  ```shell
  #macro
  #!/bin/env bash
  pwd > /tmp/temp
  
  #polo
  #!/bin/env bash
  path=$(cat /tmp/temp)
  cd "$path"
  ```

  As you see,macro save cwd to a temp file,then polo get the dir from that file them cd to it.

  then I run command like this:`./macro;cd ../;./polo`(polo and macro don't locate the same,definately),I found that my cwd doesn't change at all, but when I try `source polo` it works as expected,i.e. it go back to dir where I run ./macro previously.Why?

  ```shell
  $ tldr source
  source
  Execute commands from a file in the current shell.
  ```

  As you see,source execute commands from a file in the current shell,while shell execute script in a child process defaultly.As for polo,it will change child's cwd rather than current shell's cwd.http://c.biancheng.net/view/739.html

- [x] `$0` - Name of the script

- `$1` to `$9` - Arguments to the script. `$1` is the first argument and so on.

- `$@` - All the arguments

- `$#` - Number of arguments

- `$?` - Return code of the previous command

- `$$` - Process identification number (PID) for the current script

- `!!` - Entire last command, including arguments. A common pattern is to execute a command only for it to fail due to missing permissions; you can quickly re-execute the command with sudo by doing `sudo !!`

- `$_` - Last argument from the last command. If you are in an interactive shell, you can also quickly get this value by typing `Esc` followed by `.`

- [x] Say you have a command that fails rarely. In order to debug it you need to capture its output but it can be time consuming to get a failure run. Write a bash script that runs the following script until it fails and captures its standard output and error streams to files and prints everything at the end. Bonus points if you can also report how many runs it took for the script to fail.

  > [ INT1 -eq INT2 ]      INT1 == INT2
  > [ INT1 -ne INT2 ]      INT1 != INT2
  > [ INT1 -gt INT2 ]      INT1 > INT2
  > [ INT1 -ge INT2 ]      INT1 >= INT2
  > [ INT1 -lt INT2 ]       INT1 < INT2
  > [ INT1 -le INT2 ]      INT1 <= INT2

  **basic idea**:use `while` to run script1 infinitively until $? equels 1,where $? equels the return value of script1,0 means right,1 representative wrong.Finally echo count $i.

  ```shell
  #!/bin/bash
  declare -i i=0
  ./myScript1.sh
  i+=1
  while (($? == 0)); do
      i+=1
      ./myScript1.sh // ./myScript1.sh | grep "error" doesn't work
  done
  echo "$i times"
  ```

- [x] As we covered in the lecture `find`’s `-exec` can be very powerful for performing operations over the files we are searching for. However, what if we want to do something with **all** the files, like creating a zip file? As you have seen so far commands will take input from both arguments and STDIN. When piping commands, we are connecting STDOUT to STDIN, but some commands like `tar` take inputs from arguments. To bridge this disconnect there’s the [`xargs`](https://www.man7.org/linux/man-pages/man1/xargs.1.html) command which will execute a command using STDIN as arguments. For example `ls | xargs rm` will delete the files in the current directory.

  Your task is to write a command that recursively finds all HTML files in the folder and makes a zip with them. Note that your command should work even if the files have spaces (hint: check `-d` flag for `xargs`).

  - to build the enviroment:` mkdir dir{1,2,3};touch dir{1..3}/HTTP{a..h}`

  - then run `$ find . HTTP | grep HTTP | xargs tar cf target.tar`

  - then extract `target.tar`

    ```shell
    $ tar xvf target.tar
    ./dir1/HTTPa
    ./dir1/HTTPb
    ./dir1/HTTPc
    ./dir1/HTTPd
    ./dir1/HTTPe
    ./dir1/HTTPf
    ./dir1/HTTPg
    ./dir1/HTTPh
    ./dir2/HTTPa
    ./dir2/HTTPb
    ./dir2/HTTPc
    ./dir2/HTTPd
    ./dir2/HTTPe
    ./dir2/HTTPf
    ./dir2/HTTPg
    ./dir2/HTTPh
    ./dir3/HTTPa
    ./dir3/HTTPb
    ./dir3/HTTPc
    ./dir3/HTTPd
    ./dir3/HTTPe
    ./dir3/HTTPf
    ./dir3/HTTPg
    ./dir3/HTTPh
    ```

- [ ] (Advanced) Write a command or script to recursively find the most recently modified file in a directory. More generally, can you list all files by recency?  

  

  



