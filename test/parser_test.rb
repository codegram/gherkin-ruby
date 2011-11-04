require_relative 'test_helper'
require 'parslet'

def p(rule, input)
  parser = Gherkin::Parser.new
  parser.send(rule).parse(input)[rule]
end

module Gherkin
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

  describe 'Description parsing' do
    it 'parses descriptions ignoring their content' do
      p(:description, "  In order to know what the heck is Gherkin").size.must_be :>, 0
      p(:description, "  As a developer").size.must_be :>, 0
      p(:description, "  I want it to behave in an expected way").size.must_be :>, 0
    end
  end
end
