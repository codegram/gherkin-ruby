module GherkinRuby
  module AST
    class Node
      attr_reader :filename, :line

      def accept(visitor)
        name = self.class.name.split('::').last
        visitor.send("visit_#{name}".to_sym, self)
      end

      def pos(filename, line=nil)
        @filename, @line = filename, line
      end
    end

    class Feature < Node
      attr_reader :name, :background, :scenarios, :tags
      attr_writer :background, :scenarios, :tags
      attr_accessor :description

      include Enumerable

      def initialize(name, scenarios=[], tags=[], background=nil)
        @name       = name
        @background = background
        @tags       = tags
        @scenarios  = scenarios
      end

      def each
        @scenarios.each
      end
    end

    class Background < Node
      attr_reader :steps
      attr_writer :steps

      include Enumerable

      def initialize(steps=[])
        @steps = steps
      end

      def line
        @steps.first.line - 1 if @steps.any?
      end

      def each
        @steps.each
      end
    end

    class Scenario < Node
      attr_reader :name, :steps, :tags

      include Enumerable

      def initialize(name, steps=[], tags=[])
        @name  = name.to_s
        @steps = steps
        @tags  = tags
      end

      def line
        @steps.first.line - 1 if @steps.any?
      end

      def each
        @steps.each
      end
    end

    class Step < Node
      attr_reader :name, :keyword
      def initialize(name, keyword)
        @name    = name.to_s
        @keyword = keyword.to_s
      end
    end

    class Tag < Node
      attr_reader :name
      def initialize(name)
        @name = name
      end
    end
  end
end
