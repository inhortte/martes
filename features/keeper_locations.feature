Feature: Associations between keepers and locations

  So that I can see which keepers are at any given location
  And which location any given keeper is currently at
  As a User
  I want to see this indicated on keeper or location show page
  As an administrator
  I want to see and be able to edit these on a keeper or location edit page

  Scenario: Show the locations of a keeper (show)
    Given a keeper named "roger"
    And a number of locations
    And the location of "roger" is "terra nova"
    And the location of "roger" is "hope for wildlife"
    When I browse to keepers
    And I click "show" for the keeper "roger"
    Then I should see the locations for the keeper "roger"

  Scenario: Show the locations of a keeper (edit)
    Given a keeper named "roger"
    And a number of locations
    And the location of "roger" is "terra nova"
    When I browse to keepers
    And I click "edit" for the keeper "roger"
    Then I should see the locations for the keeper "roger"

  Scenario: Show the keepers at a location (show)
    Given a number of locations
    And a keeper named "tony"
    And the location of "tony" is "terra nova"
    When I browse to locations
    And I click "show" for the location "terra nova"
    Then I should see the keepers for the location "terra nova"
    And I should see "tony"

  Scenario: Show the keepers at a location (edit)
    Given a number of locations
    And a keeper named "roger"
    And the location of "roger" is "hope for wildlife"
    When I browse to locations
    And I click "edit" for the location "hope for wildlife"
    Then I should see the keepers for the location "hope for wildlife"
    And I should see "roger"

  Scenario: Add a location for a keeper
    Given a keeper named "roger"
    And a number of locations
    And the location of "roger" is "terra nova"
    When I browse to keepers
    And I click "edit" for the keeper "roger"
    And I choose "hope for wildlife" from "locations"
    And I press "Update"
    And I click "show" for the keeper "roger"
    Then I should see "hope for wildlife"
    When I browse to locations
    And I click "show" for the location "hope for wildlife"
    Then I should see "roger"

  Scenario: Add a keeper to a location
    Given a number of locations
    And a keeper named "tony"
    And a keeper named "roger"
    When I browse to locations
    And I click "edit" for the location "terra nova"
    And I select "tony" from "keepers"
    And I press "Update"
    And I click "show" for the location "terra nova"
    Then I should see "tony"
    When I browse to keepers
    And I click "show" for the keeper "tony"
    Then I should see "terra nova"

  Scenario: Remove a location of a keeper
    Given a keeper named "roger"
    And a number of locations
    And the location of "roger" is "hope for wildlife"
    When I browse to keepers
    And I click "edit" for the keeper "roger"
    And I click remove for the location "hope for wildlife"
    And I browse to keepers
    And I click "show" for the keeper "roger"
    Then I should not see "hope for wildlife"
    When I browse to locations
    And I click "show" for the location "hope for wildlife"
    Then I should not see "roger"

  Scenario: Remove a keeper from a location
    Given a keeper named "tony"
    And a number of locations
    And the location of "tony" is "terra nova"
    When I browse to locations
    And I click "edit" for the location "terra nova"
    And I click remove for the keeper "tony"
    And I browse to locations
    And I click "show" for the location "terra nova"
    Then I should not see "tony"
    When I browse to keepers
    And I click "show" for the keeper "tony"
    Then I should not see "terra nova"

