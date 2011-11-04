require_relative 'test_helper'
require 'parslet'

def p(rule, input)
  parser = Gherkin::Parser.new
  parser.send(rule).parse(input)[rule]
end

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
    rule(:description) { indent(2) >> match('.').repeat(1) }
  end

  describe 'Feature parsing' do
    it 'parses the Feature name' do
      p(:feature, "Feature: Test how Gherkin works").must_equal "Test how Gherkin works"
    end

    it 'parses the Scenario name' do
      p(:scenario, "  Scenario: Formal greeting").must_equal "Formal greeting"
    end

    describe 'Steps' do
      it 'parses a Given step' do
        p(:step, "    Given I have an empty array").must_equal "I have an empty array"
      end

      it 'parses a When step' do
        p(:step, "    When I have an empty array").must_equal "I have an empty array"
      end

      it 'parses a Then step' do
        p(:step, "    Then I have an empty array").must_equal "I have an empty array"
      end

      it 'parses an And step' do
        p(:step, "    And I have an empty array").must_equal "I have an empty array"
      end

      it 'parses a But step' do
        p(:step, "    But I have an empty array").must_equal "I have an empty array"
      end
    end
  end

  describe 'Comment parsing' do
    it 'parses a comment ignoring its content' do
      p(:comment, "# My comment").size.must_be :>, 0
    end
  end
end
