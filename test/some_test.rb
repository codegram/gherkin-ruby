require_relative 'test_helper'
require 'parslet'

module Gherkin

  class Parser < Parslet::Parser
    rule(:space)      { match('\s').repeat(1) }
    rule(:space?)     { space.maybe }

    rule(:feature) { str('Feature:') >> space? >> match('.').repeat(1).as(:name) }
    root :feature
  end

  describe 'Feature parsing' do
    it 'parses the Feature name' do
      parser = Parser.new
      result = parser.parse("Feature: Test how Gherkin works")
      result[:name].must_equal "Test how Gherkin works"
    end
  end
end
