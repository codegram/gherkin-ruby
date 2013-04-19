require_relative "gherkin_ruby/version"
require_relative 'gherkin_ruby/ast'
require_relative 'gherkin_ruby/parser'

module GherkinRuby
  def self.parse(input)
    parser = Parser.new
    parser.parse(input)
  end
end
