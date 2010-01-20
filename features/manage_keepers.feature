Feature: Manage keepers

  So that the list of keepers can be manipulated
  As an administrator
  I want to see and edit the list

  Scenario: Show all keepers
    Given a number of keepers
    When I browse to keepers
    Then I should see "roger"
    And I should see "tony"

  Scenario: Add a new keeper
    Given that I want to enter a new keeper
    When I browse to keepers
    And I follow "Add a Keeper"
    And I fill out the form with "henry" as a new keeper and submit it
    Then I should see "henry"

  Scenario: Delete a location
    Given a number of keepers
    When I browse to keepers
    And I see "roger" in the list of keepers
    And I click "delete" for the keeper "roger"
    Then I should not see "roger"

  Scenario: Edit a location
    Given a number of keepers
    When I browse to keepers
    And I see "roger" in the list of keepers
    And I click "edit" for the keeper "roger"
    And I change its name to "vlad"
    And I press "Update"
    Then I should see "vlad"
