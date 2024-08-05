---
---
# Using the MOS commands to access File functionality.

The MOS interface is a way of accessing system functions such as delete, rename and so on, in one of three ways

- they can be typed in at the command line with an asterisk (e.g. *del myfile.txt)
- they can use the API function which takes a string in group 2
- they can use the BASIC command which takes a string (e.g. mos "del myfile.txt" )
- they can use the BASIC function which takes a string (e.g. print mos("del myfile.txt") )

Parameters can be delimited using spaces, single quotes or double quotes

The following commands are supported

- *. or *cat , same as CAT, directory listing with mask
- *del (file) deletes a file
- *copy (file1) (file2) copies a file
- *file (file) checks a file exists
- *ren  (file1) (file2) renames a file
- *md (directory) create directory
- *cd (directory) change to directory

These commands should remain unchanged but may be extended arbitrarily.



