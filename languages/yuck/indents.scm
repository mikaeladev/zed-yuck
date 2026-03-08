; adapted for zed from tree-sitter-yuck:
; https://github.com/tree-sitter-grammars/tree-sitter-yuck/blob/main/queries/indents.scm

[
  (ast_block)
  (array)
  (expr)
  (json_array)
  (json_object)
  (parenthesized_expression)
] @indent

(_ "(" ")" @end) @indent
(_ "[" "]" @end) @indent
(_ "{" "}" @end) @indent
