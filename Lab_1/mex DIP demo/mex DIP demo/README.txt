Matlab EXecutable (MEX) Demo
====

Matlab MEX functions make it possible to mix C/C++ code (and Fortran too) with
normal Matlab scripts.  Basically these functions act like normal Matlab
functions except that they were written in C or C++.  The purpose of this code
is not to implement something special (the basic operation can be done in
exactly one line of matlab code).  Rather it's to demonstrate how a MEX function
is written and how image data is accessed.

Requirements
----

This has been tested on the following platforms:

 - Mac OS X 10.9 using XCode 5
 - Linux (Fedora 10 and Linux Mint 15)
 - Windows 7 (64-bit) using VS2012 Professional

It's adviseable to use a more recent version of Matlab.  R2013b was used on 
Mac and Windows while R2012a was used when testing on Fedora 10.

Running the Demo
----

You can't just run the MEX function like a normal m-file.  It has to be compiled
like any other C program.  Matlab provides a special 'mex' function that handles
the compiling and linking for you.  To get an idea of how to use a mex function,
run the follow in Matlab (you should be able to copy and paste this directly...
matlab will remove the '>>' automatically):

>> mex invert_grey.c
>> img = imread('cameraman.tif');
>> out = invert_grey(img);
>> imshow(img); title('cameraman.tif');
>> imshow(out); title('Inverted Image');

The first line compiles the mex function and will produce a invert_grey.mex*
file.  This is a shared library that Matlab loads and links to when the
function is first called.  You don't have to worry about how that works; just
call invert_grey() like any other Matlab function.

Troubleshooting
----

 - Finding a Compiler

Depending on your Matlab setup, you may have had some errors running the
commands above.  Generally, in a new matlab setup (or if you've never used 
mex before), you first need to tell matlab what compiler to use.  To do this,
run

>> mex -setup

Usually there's only one compiler available so just choose that.  However,
depending on your own computer's setup, there might not be one.  99% of the
time you'll have gcc available on linux and you'll be able to choose a compiler
without any problem.  On Windows and Mac, it's another story.

If you're working on Windows, you'll need to either download the Windows 7.1
SDK (needed for 64-bit compiling) or a release of Visual Studio.  At the moment
VS2013 doesn't appear to be supported.  Instead you'll need VS2012 which can be
obtained through dreamspark.com. 

On Mac OS X it's pretty straightforward: just download the latest version of 
XCode from the App Store.

Mathworks provides a pretty indepth summary of all of the support compilers at
http://www.mathworks.com/support/compilers/R2013b/index.html

 - Compiling Quirks

One of the downsides of mex functions is that because it's compiled code there
can sometimes be weird incompatibilities between platforms.  This section lists
some of the more common ones.

NOTE: If you make a mistake when tweaking the mexopts.sh file, you can restore
it by running "mex -setup" again.  All the command does is copy the version of
the file that comes with matlab itself.

 -- Mac OS X

On Mac OS X 10.9 (Mavericks), a new setup of Matlab may fail to compile because
of a missing framework.  The error looks something like, "Missing macosx10.7
SDK" and while the errors it produces are somewhat omnious, the fix is pretty
simple.  While in matlab, do the following:

>> edit ~/.matlab/R2013b/mexopts.sh

This will bring up the matlab editor.  Simply replace all instances of '10.7'
with '10.8' and save the file (it will complain about it being read-only but
the save will work).  The specific lines that need to be changed are: 128, 132,
134 and 149.  You can use the editor's "find and replace" functionality but 
doublecheck each replacement.

 -- Linux

The default matlab compiler setup on Linux uses the ANSI-C standard.  This
dates to the 1980's and really shouldn't be used for new projects (unless
necessary).  The invert_colours.c file has been written using the C99 standard 
and that adds a number of nice features to the language from C++.  Among other
things, it allows single line comments.  To change the compiler mode, change
line the 

  -ansi

flag on line 60 to

  -std=c99

and recompile.  It should compile cleanly without any warnings or errors.

 -- Windows

Windows has very poor support for C in general (the main programming language
is C++).  However, C99 can usually pass as simplified C++ so if there are
any compilation issues, change the file extension from .c to .cpp.
