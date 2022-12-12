# bash_error_lib - Bash error library

This is an error handler for any kind of bash script. The library catches mostly all defaults script errors and syntax erros by an trap and displays/logs them.

## Why?

Because i can, no... i build an install script, that installs my 
own, linux i3wm desktop. While this i nothiced that, first the errors
not shown nicely, and second, the handling of the errors is....

During the defualt search on the internet i dont find any good solution.
An Package, an all in one suite, that is easy to include and use. I like unixporn, but not only on my desktop, also on my cli output.

## How it works

An trap, set in the begin of any bash script, calls the error handler function. The function reads, validates the error, build an array that contains all needed informations for output. After that, the logger is called, than the cli output.

## Screenshots

- img1        # output cli
- img2        # output logfile


## HowTo

In the next part follows an explaination how to use the "library".

### Including in an scipt.

Just, clone it, copy in script directory, source and set the traps. Please look into the basherr.sh for more informations, this conaints an example.

