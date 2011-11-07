require 'parslet'

module Gherkin
  class Parser < Parslet::Parser
    def indent(num=2)
      str(' ' * num)
    end

    rule(:space)    { match('\s').repeat }
    rule(:space?)   { space.maybe }
    rule(:newline)  { match('\n').repeat }
    rule(:text)     { match('[^\n]').repeat }
    rule(:identifier) { match('\w').repeat }

    rule(:feature_line)  { str('Feature:') >> space? >> text.as(:name) }
    rule(:scenario_line) { indent(2) >> str('Scenario:') >> space? >> text.as(:name) }

    rule(:step_keyword) { str('Given') | str('When') | str('Then') | str('And') | str('But') }

    rule(:comment) { str('#') >> text.as(:comment) }
    rule(:description) { indent(2) >> text.as(:description) }

    rule(:step) { indent(4) >> step_keyword >> space? >> text.as(:name) }
    rule(:steps) { (step.as(:step) >> newline.maybe).repeat }

    rule(:tags) { indent(2) >> (str('@') >> identifier.as(:tag) >> str(' ').maybe).repeat(1) }

    rule(:scenario) { (tags.as(:tags) >> newline).maybe >> scenario_line >> newline >> steps.as(:steps) }
    rule(:scenarios) { (scenario.as(:scenario) >> newline.maybe).repeat }

    rule(:feature) { feature_line >> newline >> scenarios.as(:scenarios) }

    rule(:main) { feature.as(:feature) }

    root :main
  end
end
