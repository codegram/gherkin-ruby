require_relative 'test_helper'
require 'parslet'
require 'pp'

def t(input)
  parser = Gherkin::Parser.new
  result = parser.parse(input)
  transform = Gherkin::Transform.new
  transform.apply(result)
end

module Gherkin
  describe 'Feature parsing' do
    before do
      @scenario = """Feature: My Feature
  Scenario: something happens
    Given something happens
    Then something cooler happens

  Scenario: something else happens
    Given foo
    Then bar
"""
      @result = t(@scenario)
    end

    it 'rocks' do
      pp @result
    end
  end
end
