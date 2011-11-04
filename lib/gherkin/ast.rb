module Gherkin
  module AST
    class Feature
      attr_reader :name, :scenarios
      def initialize(name, scenarios)
        @name      = name
        @scenarios = scenarios
      end
    end

    class Scenario
      attr_reader :name, :steps
      def initialize(name, steps)
        @name  = name
        @steps = steps
      end
    end

    class Step
      attr_reader :name
      def initialize(name)
        @name  = name
      end
    end
  end
end
