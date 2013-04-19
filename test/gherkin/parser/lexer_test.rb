require 'test_helper'

module GherkinRuby
  describe Parser do
    before do
      @lexer = Parser.new
    end

    it 'ignores commments' do
      @lexer.tokenize("# this is a comment").must_equal []
    end

    it 'parses newlines' do
      @lexer.tokenize("\n\n").must_equal [[:NEWLINE, "\n"], [:NEWLINE, "\n"]]
    end

    it 'parses text and strips it' do
      @lexer.tokenize("  Arbitrary text ").must_equal [[:TEXT, "Arbitrary text"]]
    end

    it 'parses tags' do
      @lexer.tokenize("@javascript @wip").must_equal [
        [:TAG, "javascript"],
        [:TAG, "wip"],
      ]
    end

    describe 'Keywords' do
      %w(Feature: Background: Scenario:).each do |keyword|
        it "parses #{keyword}:" do
          name = keyword[0..-2]
          @lexer.tokenize(keyword).must_equal [[name.upcase.to_sym, name]]
        end
      end
    end

    describe 'Step keywords' do
      %w(Given When Then And But).each do |keyword|
        it "parses #{keyword}" do
          @lexer.tokenize(keyword).must_equal [[keyword.upcase.to_sym, keyword]]
        end
      end
    end
  end
end
