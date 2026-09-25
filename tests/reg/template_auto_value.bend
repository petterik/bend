import Base

# An explicit source wrapper solves three leading template arguments during
# checking. Value mode must unfold the checked caller, not its ?AUTO source.
type Source<-A: Type, -X: Type, -Drive: X -> U32> is Type:
  Source{input: X}

def String.source(xs: String) -> Source<Char, String, (ys => 2)>:
  Source{xs}

def fold_from(~A: Type, ~X: Type, ~Drive: X -> U32,
  source: Source<A, X, Drive>) -> U32:
  match source:
    case Source{input}: Drive(input)

def fold(~A: Type, ~X: Type, ~Drive: X -> U32,
  source: Source<A, X, Drive>) -> U32:
  fold_from(~A, ~X, ~Drive, source)

def from_string() -> U32:
  fold(String.source("ab"))

def main() -> U32:
  from_string()
#|2
