Cheatsheet_vim

== Startup ============================
Open vim and jump to line number
  vim +line-number filename1
Open two roles in vertical split
  vim -O filename1 filename2
Open two files in horizontal split
  vim -o filename1 filename2


=====================================

Vim opens in command mode by default
[ESC] fall back into command mode
i enter insert mode for edit pre cursor
a enter insert mode for edit post cursor
A enter insert mode append at end of line
v visual mode for specific text highlighting

Commands using : can be stacked to run in order eg :wq.
Use a number before a command to repeat it x times eg 3dd.


== FILES & BUFFERS ===================

Quit
  :q  
  (:wq for quit and save)
Quit without save
  :q!
Save file
  :w filename1 

Run program from within vim and return
  :!commands to run [optional file-name]

Insert a file contents into current file
  :r file-name
H in the background
  :badd file-name
Move to next buffer
  :bn
Move to previous buffer
  :bp
Delete current buffer
  :bd


== NAVIGATION =======================

page up 
Move to bottom of page
  L
goto file start
  [[
goto file end
  ]]
goto line number
  :line-number

goto start of line
  0
goto end of line
  $

Find
  /string 
  (n to move between results)





== OPERATIONS =======================

Delete a line 
  dd
Delete from the cursor 
  x

Copy a line
  yy 
Paste a line
  p
Paste from the system clipboard
  +p

Undo 
  u
Redo 
  [Ctrl] + r

Replace 
  :%s/search-string/replace-string/
  Append g to replace all occurances
  Append c to confirm individually
  Append i to search case insensitive


== VISUALISATION =====================

Open a vertical split window
  :vsplit filename1
Open a split window (horizontal).  
  :split filename1
  (Filename at bottom of file)
Change files in the split
  [CTRL] + ww 

Sort text
Highlight text you want to sort then
  :sort ui

Change to lowercase
  :u
Change to uppercase
  :U

Copy highlighted text 
  y
Delete highlighted text
  d


== OTHER ============================

Add line numbers
  :set number


=====================================
