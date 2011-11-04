# Gherkin
Gherkin is a pure Ruby implementation of a [Gherkin](http://github.com/cucumber/gherkin) parser, using [Parslet](http://github.com/kschiess/parslet).

# Usage
You can easily implement your own visitors to traverse the Abstract Syntax Tree:

```ruby
class MyVisitor
  def visit(ast)
    ast.accept(self)
  end

  def visit_Feature(feature)
    # Do something nasty with the feature
    # Set whatever state you want:
    #   @current_feature = feature
    # etc etc
    # And keep visiting its children:

    feature.each { |scenario| scenario.accept(self) }
  end

  def visit_Scenario(scenario)
    # Do something nasty with the scenario
    # Set whatever state you want:
    #   @current_scenario = scenario
    # etc etc
    # And keep visiting its children:

    scenario.each { |step| step.accept(self) }
  end

  def visit_Step(step)
    # Finally, print the step name.
    puts "STEP: #{step.name}"
  end
end

ast = Gherkin.parse(File.read('some.feature'))
visitor = MyVisitor.new
visitor.visit(ast)
```

Work in progress (missing backgrounds, tags, etc)! :D
