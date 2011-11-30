require 'test_helper'

module Gherkin
  describe Lexer do
    let(:lexer) { Lexer.new }

    it 'ignores commments' do
      lexer.run("# this is a comment").must_equal []
    end

    it 'parses newlines' do
      lexer.run("\n\n").must_equal [[:NEWLINE, "\n\n"]]
    end

    it 'parses text and strips it' do
      lexer.run("  Arbitrary text ").must_equal [[:TEXT, "Arbitrary text"]]
    end

    it 'parses tags' do
      lexer.run("@javascript @wip").must_equal [
        [:TAG, "javascript"],
        [:TAG, "wip"],
      ]
    end

    describe 'Keywords' do
      %w(Feature: Background: Scenario:).each do |keyword|
        it "parses #{keyword}:" do
          name = keyword[0..-2]
          lexer.run(keyword).must_equal [[name.upcase.to_sym, name]]
        end
      end
    end

    describe 'Step keywords' do
      %w(Given When Then And But).each do |keyword|
        it "parses #{keyword}" do
          lexer.run(keyword).must_equal [[keyword.upcase.to_sym, keyword]]
        end
      end
    end
  end
end
