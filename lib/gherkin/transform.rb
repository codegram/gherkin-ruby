module Gherkin
  class Transform < Parslet::Transform
    rule(
      feature: {
        name: simple(:name),
        scenarios: subtree(:scenarios)
      }
    ) { AST::Feature.new(name, scenarios) }

    rule(
      scenario: {
        name: simple(:name),
        steps: subtree(:steps)
      }
    ) { AST::Scenario.new(name, steps) }

    rule(
      step: {
        name: simple(:name),
      }
    ) { AST::Step.new(name) }
  end
end
