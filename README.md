# bash_error_lib

This is an bash error "library", an error handler for any kind of bash script. The library catches mostly all defaults script errors and syntax erros by an trap and displays/logs them.


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

## Screenshots
---
- img1        # output cli
- img2        # output logfile

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
- Error/bug fixing
- Updating of some code parts
- ++ Adding debug output/log (already done, need some review for standalone work)