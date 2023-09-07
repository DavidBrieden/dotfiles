# Movement
* HJKL
* Shift + HJKL: Hiermit können  die Fenster (bzw Splits) gewechselt werden
* Strg  + HJKL: Hiermit können die Buffer gewechselt werden
* 10gg -> jumps to line 10
* 10G -> jumps to line 10

# Buffers
* :BD -> closes file without closing the split. see bufkill.vim

# NEOTREE
* most keymaps only works in NerdTree Panel (F9)
* H -> toggle hidden files
* CD -> changes directory to current pwd
* r -> reloads current directory
* R -> reloads root directory

# surround.vim
* cs'" -> change ' tags to "
* ds" -> delete " tag
* ysiw] -> add ] tags arround text object iw (word)
* S) -> in Visual: surrounds selected text with ) tags

# Substitution
* \:s/foo/bar -> replaces foo with bar
* & -> repeats last substitution

# Telescope
* Space + ff -> Find Files
* Space + fg -> Live Grep
* Space + fb -> Find Buffers
* Space + fh -> Find help tags
* Space + fn -> Find Neovim Config Files

# Folding
all folding maps start with z. With some fantasy, this looks like a folded piece of paper. see :help usr_28
* zf -> F-old creation
* zo -> O-pen a fold
* zc -> C-lose a fold
* zr -> R-educe, open all foldings one level
* zm -> M-ore, closes all foldings one level
* Space + Space -> Toggles current fold

# LSP
* [g or ]g -> next or prev diagnostic
* gd -> goto definition
* gy -> goto type definition
* gi -> goto implementation
* gr -> view references
* Space+D -> show Doc
* rn -> rename
* Space + F -> Format
* Space + a -> apply codeAction
* Space + qf -> Quick Fix
* Space + a -> list diagnostics
* Space + c -> list commands
* :Fold -> Format whole buffer
* :OR -> organizes Import in buffer

# Misc
* :pwd -> present working directory
* :cd -> change directory
* gf -> goto file under the cursor
* Space + c + Space -> comment/uncomment current line
