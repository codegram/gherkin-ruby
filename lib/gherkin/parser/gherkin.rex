# Compile with: rex gherkin.rex -o lexer.rb

class Gherkin::Lexer

macro
  BLANK         [\ \t]+

rule
  # Whitespace
  {BLANK}       # no action
  \#.*$

  # Literals
  \n+                                   { [:NEWLINE, text] }

  # Keywords
  Feature:                              { [:FEATURE, text[0..-2]] }
  Background:                           { [:BACKGROUND, text[0..-2]] }
  Scenario:                             { [:SCENARIO, text[0..-2]] }

  # Tags
  @\w+                                  { [:TAG, text[1..-1]] }

  # Step keywords
  Given                                 { [:GIVEN, text] }
  When                                  { [:WHEN, text] }
  Then                                  { [:THEN, text] }
  And                                   { [:AND, text] }
  But                                   { [:BUT, text] }

  # Text
  [^#]*$                                { [:TEXT, text.strip] }

inner
  def run(code)
    scan_setup(code)
    tokens = []
    while token = next_token
      tokens << token
    end
    tokens
  end

end
