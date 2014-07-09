Feature: Stub GET
  As a stubber
  I want to stub GET calls
  So that I can test external services

  Scenario: Path
    Given I stub GET "/"

    When I GET "/"
    Then the response should be 200
