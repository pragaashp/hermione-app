Feature: View webcast requests submitted by faculty members/professors.

  As an ETS staff/officer/member
  So that I arrange for webcasts based on requested preferences
  I want to view requests and filter them by location, day and/or time

  Background: Preloading data...
    Given the following requests exist:
      |  CCN   |  Abbreviation  |  Professor  |    Location     | Days |   Time    |         Format          |  Status  |
      | 16903  |     TC 103     | Professor A |    10 EVANS     | TuTh | 1530-1700 |   Lecture with Slides   | Approved |
      | 16902  |     TC 102     | Professor B | 245 LI KA SHING |  MW  | 1700-1830 |      Basic Lecture      |  Pending |
      | 16901  |     TC 101     | Professor C |   2050 VLSB     |  MW  | 1830-2000 |   Multiple Chalkboard   | Declined |
    And I am on the ETS page

  Scenario: View & sort all submitted request for webcasts
    Then I should see requests for the following courses: "TC 101,TC 102,TC 103"
    And I follow "Time"
    Then I should see "TC 103" before "TC 101"
    And I follow "Course"
    Then I should see "TC 101" before "TC 102"
    And I follow "Location"
    Then I should see "10 EVANS" before "245 LI KA SHING"

  Scenario: Filter submitted requests for webcasts
    Then I should see requests for the following courses: "TC 101,TC 102,TC 103"
    And I should see the following fields: "Location,Start Time,End Time"
    When I fill in "search[start_time]" with "15:00:00"
    And I fill in "search[end_time]" with "18:00:00"
    And I press "Filter"
    Then I should see requests for the following courses: "TC 103"
    And I should not see requests for the following courses: "TC 101,TC 102"

  Scenario: Approve a submitted request
    Then I should see requests for the following courses: "TC 101,TC 102,TC 103"
    When I follow "Approve"
    And I should see "Approved"

  Scenario: Decline a submitted request
    Then I should see requests for the following courses: "TC 101,TC 102,TC 103"
    When I follow "Decline"
    And I should see "Declined"