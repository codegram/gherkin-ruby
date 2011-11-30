require 'test_helper'

module Gherkin
  describe Parser do
    def parse(input)
      parser = Parser.new
      parser.parse(input)
    end

    it 'parses feature header without description' do
      feature = parse(
        "Feature: my feature"
      )
      feature.must_be_kind_of AST::Feature
      feature.name.must_equal "my feature"
    end

    it 'parses feature header with description' do
      feature = parse(
        "Feature: my feature\n    In order to do something\n   As a user\n"
      )
      feature.must_be_kind_of AST::Feature
      feature.name.must_equal "my feature"
    end
  end
end
