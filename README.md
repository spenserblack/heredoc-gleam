# heredoc

[![Package Version](https://img.shields.io/hexpm/v/heredoc)](https://hex.pm/packages/heredoc)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/heredoc/)

```sh
gleam add heredoc@1
```
```gleam
import heredoc

pub fn main() -> Nil {
  heredoc.heredoc("
    This string will be unindented.

    It will not have any trailing spaces.
      Except for this line, which is extra indented.
  ")
}
```

Further documentation can be found at <https://hexdocs.pm/heredoc>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
```
