Feature: Manage locations

  So that the list of locations can be manipulated
  As an administrator
  I want to see and edit the list

  Scenario: Show all locations
    Given a number of locations
    When I browse to /locations
    Then I should see a list of the locations

  Scenario: Add a new location
    Given a new location form
    When I fill out the form with a new location and submit it
    Then the new location should be in the list of locations

  Scenario: Delete a location
    Given a number of locations
    When I browse to /locations
    And I see "new location" in the list of locations
    And I delete "new location"
    Then "new location" should no longer be in the list
