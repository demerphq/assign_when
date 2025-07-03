# Used by "mix format"
[
  inputs: ["{mix,.formatter}.exs", "{config,lib,test}/**/*.{ex,exs}"],
  line_length: 120,
  locals_without_parens: [set: 1],
  export: [
    locals_without_parens: [set: 1]
  ]
]
