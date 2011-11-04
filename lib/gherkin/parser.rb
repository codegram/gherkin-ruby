require 'parslet'

module Gherkin
  class Parser < Parslet::Parser
    def indent(num=2)
      str(' ' * num)
    end

    rule(:space)    { match('\s').repeat(1) }
    rule(:space?)   { space.maybe }

    rule(:feature)  { str('Feature:') >> space? >> match('.').repeat(1).as(:feature) }
    rule(:scenario) { indent(2) >> str('Scenario:') >> space? >> match('.').repeat(1).as(:scenario) }

    rule(:step) { indent(4) >> step_keyword >> space? >> match('.').repeat(1).as(:step) }
    rule(:step_keyword) { str('Given') | str('When') | str('Then') | str('And') | str('But') }

    rule(:comment) { str('#') >> match('.').repeat(1).as(:comment) }
    rule(:description) { indent(2) >> match('.').repeat(1).as(:description) }
  end
end
