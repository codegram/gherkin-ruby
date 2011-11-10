require_relative '../test_helper'
require 'ostruct'

class MyVisitor
  def visit_MyNode(my_node)
    my_node.elements
  end
end

class MyNode < Gherkin::AST::Node
  attr_reader :elements
  def initialize(name, elements)
    @name     = name
    @elements = elements
  end
end

module Gherkin
  module AST
    describe Node do
      it 'is visitable' do
        my_node = MyNode.new('My Node', ['foo', 'bar', 'baz'])
        visitor = MyVisitor.new

        my_node.accept(visitor).must_equal ['foo', 'bar', 'baz']
      end
    end

    [Feature, Scenario, Step, Tag].each do |node|
      describe node do
        it 'is a Node' do
          node.ancestors.must_include Node
        end

        it 'has a line and column' do
          name = OpenStruct.new(line_and_column: [2, 13])
          def name.to_s; 'Name'; end

          instance = node.new(name)
          instance.name.must_equal 'Name'
          instance.line.must_equal 2
          instance.column.must_equal 13
        end
      end
    end

    describe Feature do
      it 'is Enumerable' do
        name = OpenStruct.new(line_and_column: [2, 13])
        def name.to_s; 'Name'; end

        background = ['foo', 'bar']
        elements = ['+foo', '+bar']

        instance = Feature.new(name, elements, background )
        instance.background.each.to_a.must_equal ['foo', 'bar']
        instance.each.to_a.must_equal ['+foo', '+bar']
      end
    end

    describe Scenario do
      it 'is Enumerable' do
        name = OpenStruct.new(line_and_column: [2, 13])
        def name.to_s; 'Name'; end

        elements = ['foo', 'bar']

        instance = Scenario.new(name, elements)
        instance.each.to_a.must_equal ['foo', 'bar']
      end

      it 'has tags' do
        name = OpenStruct.new(line_and_column: [2, 13])
        def name.to_s; 'Name'; end

        steps = ['foo', 'bar']
        tags  = ['javascript', 'wip']

        instance = Scenario.new(name, steps, tags)
        instance.tags.must_equal tags
      end
    end

    describe Background do
      let(:steps) do
        steps = [
          OpenStruct.new(line: 4),
          OpenStruct.new(line: 5),
        ]
      end

      it 'is a Node' do
        Background.ancestors.must_include Node
      end

      it 'is Enumerable' do
        instance = Background.new(steps)
        instance.each.to_a.must_equal steps
      end

      describe 'when there are background steps' do
        it 'records line and column' do
          instance = Background.new(steps)
          instance.line.must_equal 3
          instance.column.must_equal 3
        end
      end

      describe 'otherwise' do
        it 'does not' do
          instance = Background.new([])
          instance.line.must_equal nil
          instance.column.must_equal nil
        end
      end
    end
  end
end
