# Compile with: racc gherkin.y -o parser.rb

class GherkinRuby::Parser

# Declare tokens produced by the lexer
token NEWLINE
token FEATURE BACKGROUND SCENARIO
token TAG
token GIVEN WHEN THEN AND BUT
token TEXT

rule

  Root:
    Feature     { result = val[0]; }
  |
    Feature
      Scenarios { result = val[0]; result.scenarios = val[1] }
  | FeatureTags Feature { result = val[1]; result.tags = val[0] }
  | FeatureTags Feature 
      Scenarios { result = val[1]; result.scenarios = val[2]; result.tags = val[0] }
  ;

  Newline:
    NEWLINE
  | Newline NEWLINE
  ;

  FeatureTags:
    Tags { result = val[0] }
  | Newline Tags { result = val[1] }

  Feature:
    FeatureHeader { result = val[0] }
  | FeatureHeader
      Background  { result = val[0]; result.background = val[1] }
  ;

  FeatureHeader:
    FeatureName           { result = val[0] }
  | FeatureName Newline   { result = val[0] }
  | FeatureName Newline
      Description         { result = val[0]; result.description = val[2] }
  ;

  FeatureName:
    FEATURE TEXT          { result = AST::Feature.new(val[1]); result.pos(filename, lineno) }
  | Newline FEATURE TEXT  { result = AST::Feature.new(val[2]); result.pos(filename, lineno) }
  ;

  Description:
    TEXT Newline             { result = val[0] }
  | Description TEXT Newline { result = val[0...-1].flatten }
  ;

  Background:
    BackgroundHeader
      Steps               { result = val[0]; result.steps = val[1] }
  ;

  BackgroundHeader:
    BACKGROUND Newline    { result = AST::Background.new; result.pos(filename, lineno) }
  ;

  Steps:
    Step                  { result = [val[0]] }
  | Step Newline          { result = [val[0]] }
  | Step Newline Steps    { val[2].unshift(val[0]); result = val[2] }
  ;

  Step:
    Keyword TEXT          { result = AST::Step.new(val[1], val[0]); result.pos(filename, lineno) }
  ;

  Keyword:
    GIVEN | WHEN | THEN | AND | BUT
  ;

  Scenarios:
    Scenario              { result = [val[0]] }
  | Scenarios Scenario    { result = val[0] << val[1] }
  ;

  Scenario:
    SCENARIO TEXT Newline
      Steps { result = AST::Scenario.new(val[1], val[3]); result.pos(filename, lineno - 1) }
  | Tags Newline
    SCENARIO TEXT Newline
      Steps { result = AST::Scenario.new(val[3], val[5], val[0]); result.pos(filename, lineno - 2) }
  ;

  Tags:
    TAG         { result = [AST::Tag.new(val[0])] }
  | Tags TAG    { result = val[0] << AST::Tag.new(val[1]) }
  ;

end

---- header
  require_relative "lexer"
  require_relative "../ast"

---- inner

  def parse(input)
    @yydebug = true if ENV['DEBUG_RACC']
    scan_str(input)
  end
