Feature: Keeper descriptions

  So that I know the associations of a keeper
  As a mustelid lover
  I want to see which mustelids are tended by a keeper
  And which locations the keeper is in

@new_keeper
  Scenario: Show no mustelids associated with a new keeper
    Given a keeper
    When the keeper is new
    Then the keeper should be tending no mustelids
@new_keeper
  Scenario: Show a mustelid after it is associated with a new keeper
    Given a keeper
    And the keeper is new
    When a mustelid is associated to the keeper
    Then the keeper should tend the mustelid
@new_keeper
  Scenario: A keeper stops tending a mustelid
    Given a keeper
    And the keeper tends a mustelid
    When the keeper stops tending the mustelid
    Then the keeper will no longer be associated with the mustelid

@new_keeper
  Scenario: Show no locations associated with a new keeper
    Given a keeper
    When the keeper is new
    Then the keeper should be associated to no locations
@new_keeper
  Scenario: Show a keeper after it is associated with his first location
    Given a keeper
    And the keeper is new
    And the keeper is associated to no locations
    When a keeper is associated with a location
    Then the keeper should be shown at that location
    And the keepers start_date should be set for that location
@new_keeper
  Scenario: A keeper has a new location association added
    Given a keeper
    And the keeper is associated with one location
    When a keeper is associated with another location
    Then the keeper should be shown at both locations
    And the keepers start_date should be set for the new location
@new_keeper
  Scenario: A keeper is disassociated with a location
    Given a keeper
    And the keeper is associated with one location 
    When a keeper is disassociated with the location
    Then the keepers end_date should be set for the location
    And the keeper should not be shown at the location
@new_keeper
  Scenario: List a keepers current locations
    Given a keeper
    When the keeper is associated with at least one location
    And the end_date of at least one location is not set
    Then each valid location should be listed
