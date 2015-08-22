# Tips

## Registers

* `".`: Last inserted text
* `"%`: Current filepath
* `":`: Most recent executed command
* `"#`: Alternate field (trigger via `Ctrl-^`)
* `"=`: Evaluates expression

      i
      Ctrl-r =
      2 + 2

      i
      Ctrl-r
      system("ls")

Copy register `r` to the clipboard

    :let @+=@r

