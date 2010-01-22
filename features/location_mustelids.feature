Feature: Associations between keepers and locations

  So that I can see which mustelids are at any given location
  And which location any given mustelid is currently at
  As a User
  I want to see this indicated on mustelid or location show page
  As an administrator
  I want to see and be able to edit these on a mustelid or location edit page

  Scenario: Show the location of a mustelid (show)
    Given a mustelid named "gretel"
    And a number of locations
    And the location of the mustelid "gretel" is "terra nova"
    When I browse to mustelids
    And I click "show" for the mustelid "gretel"
    And I should see "terra nova"

  Scenario: Show the location of a mustelid (edit)
    Given a mustelid named "julia"
    And a number of locations
    And the location of the mustelid "julia" is "terra nova"
    When I browse to mustelids
    And I click "edit" for the mustelid "julia"
    Then I should see the location for the mustelid "julia"
    And I should see "terra nova"

  Scenario: Show the mustelids at a location (show)
    Given a number of locations
    And a mustelid named "julia"
    And the location of the mustelid "julia" is "terra nova"
    When I browse to locations
    And I click "show" for the location "terra nova"
    Then I should see the mustelids for the location "terra nova"
    And I should see "julia"

  Scenario: Show the mustelids at a location (edit)
    Given a number of locations
    And a mustelid named "gretel"
    And the location of the mustelid "gretel" is "hope for wildlife"
    When I browse to locations
    And I click "edit" for the location "hope for wildlife"
    Then I should see the mustelids for the location "hope for wildlife"
    And I should see "gretel"

  Scenario: Add a location for a mustelid
    Given a mustelid named "gretel"
    And a number of locations
    And the location of the mustelid "gretel" is "terra nova"
    When I browse to mustelids
    And I click "edit" for the mustelid "gretel"
    And I choose "hope for wildlife" from "location"
    And I press "Update"
    And I click "show" for the mustelid "gretel"
    Then I should see "hope for wildlife"
    When I browse to locations
    And I click "show" for the location "hope for wildlife"
    Then I should see "gretel"

  Scenario: Add a mustelid to a location
    Given a number of locations
    And a mustelid named "julia"
    And a mustelid named "gretel"
    When I browse to locations
    And I click "edit" for the location "terra nova"
    And I select "julia" from "mustelids"
    And I press "Update"
    And I click "show" for the location "terra nova"
    Then I should see "julia"
    When I browse to mustelids
    And I click "show" for the mustelid "julia"
    Then I should see "terra nova"

  Scenario: Remove a mustelid from a location
    Given a mustelid named "julia"
    And a number of locations
    And the location of the mustelid "julia" is "terra nova"
    When I browse to locations
    And I click "edit" for the location "terra nova"
    And I click remove for the mustelid "julia"
    And I browse to locations
    And I click "show" for the location "terra nova"
    Then I should not see "julia"
    When I browse to mustelids
    And I click "show" for the mustelid "julia"
    Then I should not see "terra nova"

