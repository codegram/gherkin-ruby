require_relative '../test_helper'
require 'parslet'

module Gherkin
  describe 'Feature parsing' do
    before do
      @scenario = """Feature: My Feature
  Scenario: something happens
    Given something happens
    Then something cooler happens

  @javascript @wip
  Scenario: something else happens
    Given foo
    Then bar
"""
      parser    = Gherkin::Parser.new
      result    = parser.parse(@scenario)
      transform = Gherkin::Transform.new
      @result   = transform.apply(result)
    end

    it 'generates a nice tree' do
      @result.must_be_kind_of AST::Feature
      @result.line.must_equal 1

      first_scenario = @result.scenarios.first
      first_scenario.must_be_kind_of AST::Scenario
      first_scenario.line.must_equal 2
      first_scenario.name.must_equal 'something happens'
      first_scenario.steps.first.name.must_equal 'something happens'
      first_scenario.steps.first.line.must_equal 3
      first_scenario.steps.last.name.must_equal 'something cooler happens'
      first_scenario.steps.last.line.must_equal 4

      last_scenario = @result.scenarios.last
      last_scenario.must_be_kind_of AST::Scenario
      last_scenario.line.must_equal 7
      last_scenario.name.must_equal 'something else happens'

      last_scenario.tags.first.name.must_equal 'javascript'
      last_scenario.tags.last.name.must_equal 'wip'

      last_scenario.steps.first.name.must_equal 'foo'
      last_scenario.steps.first.line.must_equal 8
      last_scenario.steps.last.name.must_equal 'bar'
      last_scenario.steps.last.line.must_equal 9
    end
  end
end
