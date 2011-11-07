module Gherkin
  module AST
    class Node
      attr_reader :line, :column

      def accept(visitor)
        name = self.class.name.split('::').last
        visitor.send("visit_#{name}".to_sym, self)
      end
    end

    class Feature < Node
      attr_reader :name, :scenarios

      include Enumerable

      def initialize(name, scenarios=[])
        @line, @column = name.line_and_column

        @name      = name.to_s
        @scenarios = scenarios
      end

      def each
        @scenarios.each
      end
    end

    class Scenario < Node
      attr_reader :name, :steps, :tags

      include Enumerable

      def initialize(name, steps=[], tags=[])
        @line, @column = name.line_and_column

        @name  = name.to_s
        @steps = steps
        @tags  = tags
      end

      def each
        @steps.each
      end
    end

    class Step < Node
      attr_reader :name
      def initialize(name)
        @line, @column = name.line_and_column

        @name = name.to_s
      end
    end

    class Tag < Node
      attr_reader :name
      def initialize(name)
        @line, @column = name.line_and_column

        @name = name.to_s
      end
    end
  end
end
