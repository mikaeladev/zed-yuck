; adapted for zed from tree-sitter-yuck:
; https://github.com/tree-sitter-grammars/tree-sitter-yuck/blob/main/queries/highlights.scm

(comment) @comment

[
  "+"
  "-"
  "*"
  "/"
  "%"
  "||"
  "&&"
  "=="
  "!="
  "=~"
  ">"
  "<"
  ">="
  "<="
  "!"
  "?."
  "?:"
] @operator

(ternary_expression
  ["?" ":"] @operator)

[ ":" "." "," ] @punctuation.delimiter
[ "{" "}" "[" "]" "(" ")" ] @punctuation.bracket

(number (float)) @number
(number (integer)) @number
(boolean) @boolean

(escape_sequence) @string.escape

(string_interpolation
  "${" @punctuation.special
  "}" @punctuation.special)

[ (string_fragment) "\"" "'" "`" ] @string

(keyword) @attribute

(function_call
  name: (ident) @function)

(ident) @variable

(array
  (symbol) @variable)

(list .
  ((symbol) @tag
    (#match? @tag "^(box|button|calendar|centerbox|checkbox|circular-progress|color-button|color-chooser|combo-box-text|eventbox|expander|graph|image|input|label|literal|overlay|progress|revealer|scale|scroll|transform)$")))

(list .
  ((symbol) @keyword
    (#match? @keyword "^(defwindow|defwidget|defvar|defpoll|deflisten|geometry|children|struts)$")))

(list .
  ((symbol) @keyword
    (#eq? @keyword "include")))

(loop_widget . "for" @keyword . (symbol) @variable . "in" @keyword . (symbol) @variable)
(loop_widget . "for" @keyword . (symbol) @variable . "in" @keyword)

(list
  (symbol) @tag)

(ident) @variable
(index) @variable
