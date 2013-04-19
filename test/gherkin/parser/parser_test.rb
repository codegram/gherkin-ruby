require 'test_helper'

module GherkinRuby
  describe Parser do
    def parse(input)
      parser = Parser.new
      parser.parse(input)
    end

    describe 'Feature name and description' do
      it 'parses feature header without description' do
        feature = parse(
          "Feature: my feature"
        )
        feature.must_be_kind_of AST::Feature
        feature.name.must_equal "my feature"
      end

      it 'parses feature header with description' do
        feature = parse(
          "Feature: my feature\n    In order to do something\n   As a user\n"
        )
        feature.must_be_kind_of AST::Feature
        feature.name.must_equal "my feature"
      end

      it 'parses feature with tags' do
        feature = parse("""
@wip @with-dash
Feature: Do something
""")
        feature.name.must_equal "Do something"
        feature.tags.first.name.must_equal "wip"
        feature.tags.last.name.must_equal "with-dash"
      end

      it 'parses feature with tagsi event without newline at start' do
        feature = parse(
          "@wip\nFeature: Do something"
        )
        feature.name.must_equal "Do something"
        feature.tags.first.name.must_equal "wip"
      end

      it 'parses feature with background' do
        feature = parse("""
Feature: Do something

  Background:
    Given blah foo bar
    Then something else
""")
        feature.name.must_equal "Do something"
        feature.background.must_be_kind_of AST::Background
        steps = feature.background.steps

        given_step = steps.first
        then_step  = steps.last

        given_step.keyword.must_equal "Given"
        given_step.name.must_equal "blah foo bar"
        then_step.keyword.must_equal "Then"
        then_step.name.must_equal "something else"
      end

      it 'parses feature with scenarios' do
        feature = parse("""
Feature: Do something

  Scenario: Foo bar baz
    Given blah foo bar
    Then something else

  Scenario: Foo bar baz blah
    Given blah foo bar
    Then something else
""")
        scenarios = feature.scenarios

        first_scenario = scenarios.first
        last_scenario  = scenarios.last

        first_scenario.name.must_equal "Foo bar baz"
        first_scenario.steps.first.name.must_equal "blah foo bar"
        first_scenario.steps.last.name.must_equal "something else"

        last_scenario.name.must_equal "Foo bar baz blah"
        last_scenario.steps.first.name.must_equal "blah foo bar"
        last_scenario.steps.last.name.must_equal "something else"
      end

      it 'parses feature with no ending newline' do
        feature = parse(%(
Feature: Do something

  Scenario: Foo bar baz
    Given blah foo bar
    Then something else))
        scenarios = feature.scenarios
        scenarios.size.must_equal 1

        first_scenario = scenarios.first

        first_scenario.name.must_equal "Foo bar baz"
        first_scenario.steps.first.name.must_equal "blah foo bar"
        first_scenario.steps.last.name.must_equal "something else"
      end

      it 'parses feature with scenarios with tags' do
        feature = parse("""
Feature: Do something

  Scenario: Foo bar baz
    Given blah foo bar
    Then something else

  @javascript @wip @with-vcr
  Scenario: Foo bar baz blah
    Given blah foo bar
    Then something else
""")
        scenarios = feature.scenarios

        last_scenario  = scenarios.last

        last_scenario.tags[0].name.must_equal "javascript"
        last_scenario.tags[1].name.must_equal "wip"
        last_scenario.tags[2].name.must_equal "with-vcr"
      end
    end
  end
end
