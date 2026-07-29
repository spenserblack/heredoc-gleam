import gleam/list
import gleam/result
import gleam/string

/// Unindents a string.
pub fn heredoc(s: String) -> String {
  s |> string.split("\n") |> heredoc_list()
}

fn heredoc_list(lines: List(String)) -> String {
  // NOTE In a well-formatted heredoc, the first line should be empty.
  case lines {
    ["", first, ..rest] -> heredoc_impl(first, rest)
    _ -> ""
  }
}

fn heredoc_impl(first: String, rest_lines: List(String)) -> String {
  let #(indentation, clean_first) = collect_indentation(first)
  let clean_lines =
    rest_lines
    |> list.map(fn(line) { line |> string.remove_prefix(indentation) })

  clean_lines
  |> list.prepend(clean_first)
  |> list.map(fn(line) { line |> string.trim_end() })
  |> list.reduce(fn(collected, line) { collected <> "\n" <> line })
  |> result.lazy_unwrap(unreachable)
  |> string.trim_end()
}

/// Collects indentation. The left side is the indentation, and the right side is the remainder of
/// the string.
pub fn collect_indentation(s: String) -> #(String, String) {
  collect_indentation_inner(s, "")
}

fn collect_indentation_inner(
  s: String,
  indentation: String,
) -> #(String, String) {
  case s {
    " " as grapheme <> rest | "\t" as grapheme <> rest ->
      collect_indentation_inner(rest, indentation <> grapheme)
    _ -> #(indentation, s)
  }
}

/// Always panics.
fn unreachable() -> value {
  panic as "unreachable"
}
