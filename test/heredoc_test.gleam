import gleeunit
import heredoc

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn heredoc_test() {
  let got =
    heredoc.heredoc(
      "
    This is a heredoc

    It does not have indentation.
      Except for additional indentation.
  ",
    )
  let want =
    "This is a heredoc

It does not have indentation.
  Except for additional indentation."

  assert got == want
}

pub fn heredoc_empty_test() {
  assert heredoc.heredoc("") == ""
}

pub fn heredoc_no_text_test() {
  assert heredoc.heredoc("  ") == ""
}

pub fn collect_indentation_test() {
  assert heredoc.collect_indentation(" \t abc") == #(" \t ", "abc")
}
