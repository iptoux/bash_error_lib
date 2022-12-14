# bash_error_lib

<p align="center" width="100%">
    <img src="https://img.shields.io/github/package-json/v/iptoux/bash_error_lib?style=for-the-badge" title="GitHub package.json version">
    <img src="https://img.shields.io/github/directory-file-count/iptoux/bash_error_lib/lib?style=for-the-badge" title="GitHub repo file count (file extension)">
    <img src="https://img.shields.io/github/languages/code-size/iptoux/bash_error_lib?style=for-the-badge" title="GitHub code size in bytes">
    <img src="https://img.shields.io/github/issues/iptoux/bash_error_lib?style=for-the-badge" title="GitHub issues">
    <img src="https://img.shields.io/github/license/iptoux/bash_error_lib?style=for-the-badge" title="GitHub">
    <img src="https://img.shields.io/github/package-json/keywords/iptoux/bash_error_lib?style=flat-square" title="GitHub package.json dynamic"> 
</p>

This is an bash error "library", an error handler for any kind of bash script. The library catches mostly all errors by an trap and displays/logs them. The library includes:

- error logging
- debug logging
- display stack
- colors & (themes)
- own manual manages
- STANDALONE SINGLEFILE!

## Index


- [Why](https://github.com/iptoux/bash_error_lib#why)
- [How it works](https://github.com/iptoux/bash_error_lib#how-it-works)
- [Control](https://github.com/iptoux/bash_error_lib#control)
- [Screenshots/Output](https://github.com/iptoux/bash_error_lib#screenshotsoutput)
- [HowTo/Usage/Install](https://github.com/iptoux/bash_error_lib#howto)
- [Example](https://github.com/iptoux/bash_error_lib#example)
- [Todo](https://github.com/iptoux/bash_error_lib#todo)



## Why?
---
While i build an install script, that installs my own, linux i3wm desktop, i nothiced that:

- The errors not shown nicely
- The handling of the errors is....
- I like unixporn, not only on desktop, also on cli output!

During the defualt search on the internet i dont find any good solution.
An Package, an all in one suite, that is easy to include and use.

## How it works
---
An trap, set in the begin of any kind of bash script, calls the error handler function. The function reads the vars given by trap. Than it loads the error from the redirected stderr and merges them into and error container. After some checks of user variables(debug/log/stack), the output message will be build and printed.

## Control

- [ ] Option to exit on error
- [x] Option to enable/disable logging (file)
- [x] Option to display errorstack
- [x] Option to display source code snipped (from called error)
- [x] Option to enable colors on output
- [x] Option to enable debug (also via cmd option)
- [x] Option to set manual errors on any line.

## Screenshots/Output
---

**CLI-TRAP**
```console
iptoux@2040:~/gits/bash_error_lib$ ./basherr.sh 

------------------------------------------------
>> ERROR (1) - General/External script error.

>> MSG: No such file or directory
>> CALL/CMD/ARG: lol

>> CAUSE BY: cat IN: ./basherr.sh ON LINE: 50
>> FULLSTACK:
    huhu @ ./basherr.sh:50
    main @ ./basherr.sh:54

>> SNIPPED:

>> -> 08 lines of source from  <-
>> {
L:46      #somecommand        # <-
L:47      
L:48      huhu() {
L:49      
L:50   >>>    cat lol
L:51      
L:52      }
L:53      
L:54      huhu
>> }

>> There are 6 log files in folder, cleaning....
>> Execution time: 0.322949 seconds
iptoux@2040:~/gits/bash_error_lib$ 
```

**CLI-MANUAL**
```console
iptoux@2040:~/gits/bash_error_lib$ ./basherr.sh 

------------------------------------------------
>> ERROR (1) - (M): General/External script error.

>> MSG: this is an random error
>> CALL/CMD/ARG: N/A (see message)
>> CAUSE BY: huhu IN: ./basherr.sh ON LINE: 50

>> SNIPPED:

>> -> 06 lines of source from ./basherr.sh <-
>> {
L:47      
L:48      huhu() {
L:49      
L:50   >>>_error "this is an random error"
L:51      
L:52      }
L:53      
>> }

>> There are 6 debug log files in folder, cleaning....
>>  Execution time: 0.17364144325256348 seconds

iptoux@2040:~/gits/bash_error_lib$
```

**DEBUG-LOG FILE**
```
iptoux@2040:~/gits/bash_error_lib$ ./basherr.sh
iptoux@2040:~/gits/bash_error_lib$ cat 12.15.22_1835637.log 
- [T]: 22:38:47 [F]: basherr.sh [M]:  [L]: 26 [C]: trap 'bs_error "$?" "${FUNCNAME[0]}"' ERR
- [T]: 22:38:47 [F]: basherr.sh [M]:  [L]: 27 [C]: trap 'bs_error "$?" "${FUNCNAME[0]}"' EXIT
- [T]: 22:38:47 [F]: basherr.sh [M]:  [L]: 28 [C]: trap bs_clean EXIT
- [T]: 22:38:47 [F]: basherr.sh [M]:  [L]: 42 [C]: bs_debug false
- [T]: 22:38:47 [F]: bash_error_lib [M]: bs_debug [L]: 176 [C]: switch=false
- [T]: 22:38:47 [F]: bash_error_lib [M]: bs_debug [L]: 178 [C]: '[' false == auto ']'
- [T]: 22:38:47 [F]: bash_error_lib [M]: bs_debug [L]: 178 [C]: '[' false == true ']'
- [T]: 22:38:47 [F]: bash_error_lib [M]: bs_debug [L]: 187 [C]: '[' false == false ']'
- [T]: 22:38:47 [F]: bash_error_lib [M]: bs_debug [L]: 188 [C]: set +o xtrace
iptoux@2040:~/gits/bash_error_lib$ 
```

**ERROR-LOG FILE**
```
>> Date/Time: 23.12.2022 - 23:44:38
------------------------------------------------
>> ERROR (1) - General/External script error.

>> MSG: No such file or directory
>> CALL/CMD/ARG: lol

>> CAUSE BY: cat IN: ./basherr.sh ON LINE: 50
>> FULLSTACK:
    huhu @ ./basherr.sh:50
    main @ ./basherr.sh:54

>> SNIPPED:

>> -> 08 lines of source from  <-
>> {
L:46      #somecommand        # <-
L:47      
L:48      huhu() {
L:49      
L:50   >>>    cat lol
L:51      
L:52      }
L:53      
L:54      huhu
>> }
```

---

**IMAGES**

- default error with color

![default error with color](../assets/v1.2.4/color_default_error.png)

- syntax error without color (also with possible)

![syntax error without color](../assets/v1.2.4/nocolor_syntax_error.png)

- manual error with color

![manual error with color](../assets/v1.2.4/color_manual.png)

- external error without color (also with possible)

![external error without color](../assets/v1.2.4/nocolor_external.png)



## HowTo
---
In the next parts follow an explaination how to use the "library".

**Cloning:**

Download repositorys latest zip or clone to your local storage.
Copy file into your script directory (can an subdirectory too)

**Including in an scipt:**

Source file in your script

```
. 'path/to/library_file'
```

Set Traps

```
# setting up Traps
trap 'bs_error_trap "$?" "${BASH_SOURCE[0]}" "${LINENO}" "${FUNCNAME}"' ERR
trap 'bs_error_trap "$?" "${BASH_SOURCE[0]}" "${LINENO}" "${FUNCNAME}"' EXIT

```

**Done**

Yes! thats all, now the library is ready an loaded in your script when you run it next time.

## Example?

The `basherr.sh` in the repo is an example, that shows how to include in your script and calls errors. All files are "well" documented.

## ToDo

- [ ] More documentation