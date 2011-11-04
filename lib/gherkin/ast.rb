module Gherkin
  module AST
    class Node
      attr_reader :line, :column
    end

    class Feature < Node
      attr_reader :name, :scenarios
      def initialize(name, scenarios)
        @line, @column = name.line_and_column

        @name      = name.to_s
        @scenarios = scenarios
      end
    end

    class Scenario < Node
      attr_reader :name, :steps
      def initialize(name, steps)
        @line, @column = name.line_and_column

        @name  = name.to_s
        @steps = steps
      end
    end

    class Step < Node
      attr_reader :name
      def initialize(name)
        @line, @column = name.line_and_column

        @name  = name.to_s
      end
    end
  end
end
