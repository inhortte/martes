Feature: Location associations

  So that I know the associations of a location
  As a mustelid lover
  I want to see which mustelids are in a location
  And which keepers tend to those mustelids in the location

@new_loc_wo_mustelid
  Scenario: Show no mustelids associated with a new location
    Given a location
    When the location is new
    Then the location should contain no mustelids
@new_loc_w_mustelid
  Scenario: Show a mustelid after it is associated with a new location
    Given a location
    And the location is new
    When a mustelid is associated with the location
    Then the location should contain the mustelid

