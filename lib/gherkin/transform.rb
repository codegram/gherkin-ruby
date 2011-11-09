module Gherkin
  class Transform < Parslet::Transform
    # Match feature with background
    rule(
      feature: {
        name: simple(:name),
        background: {
          steps: subtree(:background_steps)
        },
        scenarios: subtree(:scenarios)
      }
    ) { AST::Feature.new(name, scenarios, AST::Background.new(background_steps)) }

    # Match feature without background
    rule(
      feature: {
        name: simple(:name),
        scenarios: subtree(:scenarios)
      }
    ) { AST::Feature.new(name, scenarios, AST::Background.new([])) }

    # Match scenarios without tags
    rule(
      scenario: {
        name: simple(:name),
        steps: subtree(:steps)
      }
    ) { AST::Scenario.new(name, steps, []) }

    # Match scenarios with tags
    rule(
      scenario: {
        name: simple(:name),
        steps: subtree(:steps),
        tags: subtree(:tags)
      }
    ) { AST::Scenario.new(name, steps, tags) }

    rule(
      step: {
        name: simple(:name),
      }
    ) { AST::Step.new(name) }

    rule(
      tag: simple(:name)
    ) { AST::Tag.new(name) }
  end
end
