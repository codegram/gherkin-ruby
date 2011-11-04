require 'parslet'
require_relative "gherkin/version"
require_relative 'gherkin/ast'
require_relative 'gherkin/parser'
require_relative 'gherkin/transform'

module Gherkin
  def self.parse(input)
    parser    = Parser.new
    transform = Transform.new

    parsed = parser.parse input
    transform.apply(parsed)
  end
end
