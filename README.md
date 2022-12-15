# bash_error_lib

<p align="center" width="100%">
    <img src="https://img.shields.io/github/package-json/v/iptoux/bash_error_lib?style=for-the-badge" title="GitHub package.json version">
    <img src="https://img.shields.io/github/directory-file-count/iptoux/bash_error_lib/lib?style=for-the-badge" title="GitHub repo file count (file extension)">
    <img src="https://img.shields.io/github/languages/code-size/iptoux/bash_error_lib?style=for-the-badge" title="GitHub code size in bytes">
    <img src="https://img.shields.io/github/issues/iptoux/bash_error_lib?style=for-the-badge" title="GitHub issues">
    <img src="https://img.shields.io/github/license/iptoux/bash_error_lib?style=for-the-badge" title="GitHub">
    <img src="https://img.shields.io/github/package-json/keywords/iptoux/bash_error_lib?style=for-the-badge" title="GitHub package.json dynamic">
    
</p>

This is an bash error "library", an error handler for any kind of bash script. The library catches mostly all defaults script errors and syntax erros by an trap and displays/logs them.

## Index


- [Why](https://github.com/iptoux/bash_error_lib/tree/2-debug-output#why)
- [How it works](https://github.com/iptoux/bash_error_lib/tree/2-debug-output#how-it-works)
- [Control](https://github.com/iptoux/bash_error_lib/tree/2-debug-output#control)
- [Screenshots/Output](https://github.com/iptoux/bash_error_lib/tree/2-debug-output#screenshotsoutput)
- [HowTo/Usage/Install](https://github.com/iptoux/bash_error_lib/tree/2-debug-output#howto)
- [Example](https://github.com/iptoux/bash_error_lib/tree/2-debug-output#example)
- [Todo](https://github.com/iptoux/bash_error_lib/tree/2-debug-output#todo)



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
An trap, set in the begin of any bash script, calls the error handler function. The function reads, validates the error, build an array that contains all needed informations for output. After that, the logger is called, than the cli output.

## Control

- Option to exit on error
- Option to display source code snipped (from called error)
- Oprion to log in an error file

## Screenshots/Output
---

**CLI**
```
iptoux@2040:~/gits/bash_error_lib$ ./basherr.sh 

------------------------------------------------

>> ERROR (127) - Command (func) not found.
>> -> somecommand <-

>> Caused by:  Source.
>> At file: ./basherr.sh on or near line 42

>> Exit on error: true
>> Code-snipped: true

------------------------------------------------

>> -> 08 lines of source from ./basherr.sh <-
>> {
L:38      
L:39      # Unknown command or an unknown function of
L:40      # script.
L:41      
L:42   >>>somecommand
>> }

iptoux@2040:~/gits/bash_error_lib$ 
```

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

**LOG**
```
#### + 22:53:57 + ###################### ERROR ########################
##
##	Exitcode: 127		|	Msg: command not found
##
##	>>> somecommand
##
##	------------------------------------------------------------
##
##	Call from:  Source.		|	Line: 42
##
##	File: ./basherr.sh
##
##	------------------------------------------------------------
##
##		>>> 08 lines of source code (snipped) <<<
##
## {
##	L:38      
##	L:39      # Unknown command or an unknown function of
##	L:40      # script.
##	L:41      
##	L:42   >>>somecommand
## }
##
########################################################## EXIT #######
```

---

**IMAGES**

![CLI](../assets/cli.png?raw=true)

![LOG](../assets/log.png?raw=true)

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
trap 'bs_error "$?" "${FUNCNAME[0]}"' ERR
trap 'bs_error "$?" "${FUNCNAME[0]}"' EXIT
trap 'bs_clean' EXIT
```

**Done**

Yes! thats all, now the library is ready an loaded in your script when you run it next time.

## Example?

`The basherr.sh in the repo is an example, that shows how to include in your script and calls errors. All files are "well" documented.

## ToDo

- More documentation