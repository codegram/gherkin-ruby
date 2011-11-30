# Compile with: racc gherkin.y -o parser.rb

class Gherkin::Parser

# Declare tokens produced by the lexer
token NEWLINE
token FEATURE BACKGROUND SCENARIO
token TAG
token GIVEN WHEN THEN AND BUT
token TEXT

rule

  Root:
    Feature       { result = val[0] }
  ;

  Feature:
    FEATURE TEXT          { result = AST::Feature.new(val[1]) }
  | FEATURE TEXT NEWLINE
      Description         { result = AST::Feature.new(val[1]) }
  ;

  Description:
    TEXT NEWLINE
  | Description TEXT NEWLINE
  ;

end

---- header
  require_relative "lexer"
  require_relative "../ast"

---- inner
  def parse(code, show_tokens=false)
    @tokens = Lexer.new.run(code)
    p @tokens if show_tokens
    do_parse
  end

  def next_token
    @tokens.shift
  end
