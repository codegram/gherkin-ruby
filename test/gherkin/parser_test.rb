require_relative '../test_helper'
require 'parslet'

def p(rule, input, tag=nil)
  tag ||= rule
  parser = Gherkin::Parser.new
  parser.send(rule).parse(input)[tag]
end

module Gherkin
  describe 'Feature parsing' do
    it 'parses the Feature name' do
      p(:feature_line, "Feature: Test how Gherkin works", :name).must_equal "Test how Gherkin works"
    end

    it 'parses the Scenario name' do
      p(:scenario_line, "  Scenario: Formal greeting", :name).must_equal "Formal greeting"
    end

    describe 'Steps' do
      it 'parses a Given step' do
        p(:step, "    Given I have an empty array", :name).must_equal "I have an empty array"
      end

      it 'parses a When step' do
        p(:step, "    When I have an empty array", :name).must_equal "I have an empty array"
      end

      it 'parses a Then step' do
        p(:step, "    Then I have an empty array", :name).must_equal "I have an empty array"
      end

      it 'parses an And step' do
        p(:step, "    And I have an empty array", :name).must_equal "I have an empty array"
      end

      it 'parses a But step' do
        p(:step, "    But I have an empty array", :name).must_equal "I have an empty array"
      end
    end
  end

  describe 'Tag parsing' do
    it 'parses the Scenario Tag' do
      p(:tag, "  @javascript", :name).must_equal "javascript"
    end
  end

  describe 'Comment parsing' do
    it 'parses a comment ignoring its content' do
      p(:comment, "# My comment").size.must_be :>, 0
    end
  end

  describe 'Description parsing' do
    it 'parses descriptions ignoring their content' do
      p(:description, "  In order to know what the heck is Gherkin").size.must_be :>, 0
      p(:description, "  As a developer").size.must_be :>, 0
      p(:description, "  I want it to behave in an expected way").size.must_be :>, 0
    end
  end

  describe 'Parses scenario objects' do
    it 'parses a Scenario' do
      parser = Gherkin::Parser.new
      scenario = "  Scenario: Parse a scenario\n    Given something happens\n    Then something cooler happens"
      result = parser.scenario.parse(scenario)

      result[:name].must_equal 'Parse a scenario'
      result[:steps][0][:step][:name].must_equal 'something happens'
      result[:steps][1][:step][:name].must_equal 'something cooler happens'
    end

    it 'parses a Scenario with a tag' do
      parser = Gherkin::Parser.new
      scenario = "  @javascript\n  Scenario: Parse a scenario\n    Given something happens\n    Then something cooler happens"
      result = parser.scenario.parse(scenario)

      result[:tag][:name].must_equal 'javascript'
      result[:name].must_equal 'Parse a scenario'
      result[:steps][0][:step][:name].must_equal 'something happens'
      result[:steps][1][:step][:name].must_equal 'something cooler happens'
    end
  end

  describe 'Parses feature objects' do
    it 'parses a Feature' do
      parser = Gherkin::Parser.new
      scenario = """Feature: My Feature
  @javascript
  Scenario: something happens
    Given something happens
    Then something cooler happens

  Scenario: something else happens
    Given foo
    Then bar
"""
      result = parser.parse(scenario)

      result[:feature][:name].must_equal 'My Feature'

      result[:feature][:scenarios][0][:scenario][:tag][:name].must_equal 'javascript'
      result[:feature][:scenarios][0][:scenario][:name].must_equal 'something happens'
      result[:feature][:scenarios][0][:scenario][:steps][0][:step][:name].must_equal 'something happens'
      result[:feature][:scenarios][0][:scenario][:steps][1][:step][:name].must_equal 'something cooler happens'

      result[:feature][:scenarios][1][:scenario][:name].must_equal 'something else happens'
      result[:feature][:scenarios][1][:scenario][:steps][0][:step][:name].must_equal 'foo'
      result[:feature][:scenarios][1][:scenario][:steps][1][:step][:name].must_equal 'bar'
    end
  end
end
