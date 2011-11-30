require_relative "gherkin/version"
require_relative 'gherkin/ast'
require_relative 'gherkin/parser'

module Gherkin
  def self.parse(input)
    parser = Parser.new
    parser.parse(input)
  end
end
