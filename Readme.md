# gherkin-ruby [![Build Status](https://secure.travis-ci.org/codegram/gherkin-ruby.png)](http://travis-ci.org/codegram/gherkin-ruby) [![Dependency Status](https://gemnasium.com/codegram/gherkin-ruby.png)](http://gemnasium.com/codegram/gherkin-ruby)
Gherkin-ruby is a pure Ruby implementation of a [Gherkin](http://github.com/cucumber/gherkin) parser.

Tested with MRI 1.9.3, 2.0.0, head, Rubinius 2.0.0-rc1 and Rubinius head.

## WARNING: Will be deprecated after Gherkin 3.0

A new rewrite of the Gherkin parser used by Cucumber is planned (for version
3.0) gherkin-ruby will not add any more features until then, and will
eventually be deprecated in favor of Gherkin 3.0.

## FAQ

### Why this one over the official, fast, Ragel-based Gherkin parser?

* Less than 200 LOC.
* No Java/.NET crap.
* Fast enough for our purposes (using it for the [Spinach](http://github.com/codegram/spinach) project)

### Why don't you support tables?

* Because we believe it's a BDD anti-pattern. Tables show the need for more
  unit tests.

## Install

    $ gem install gherkin-ruby

Or in your Gemfile:

```ruby
# Gemfile

gem 'gherkin-ruby'
```

## Usage
You can easily implement your own visitors to traverse the Abstract Syntax Tree. The following example just prints the step names to standard output:

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

  def visit_Background(background)
    # Do something nasty with the background
    # And keep visiting its children:

    background.each { |step| step.accept(self) }
  end

  def visit_Tag(tag)
    # Do something nasty with the tag
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

## Todo

* Some optimization

## FAQ



## License

MIT (Expat) License. Copyright 2011-2013 [Codegram Technologies](http://codegram.com)
