Feature: View webcast requests submitted by faculty members/professors.

  As an ETS staff/officer/member
  So that I arrange for webcasts based on requested preferences
  I want to view requests and filter them by location, day and/or time

  Given the following requests exist:
    |  CCN   |  Title  |  Professor  |    Location     | Days |   Time    |         Request          |  Status  |
    | 26619  |  CS 169 | Armando Fox |    10 EVANS     | TuTh | 1530-1700 |    Audio & Projector     | Approved |
    | 26520  |  CS 162 | Joseph, A D | 245 LI KA SHING |  MW  | 1700-1830 |      Audio & Video       |  Pending |
    | 26826  |  CS 189 | Shewchuk, J |   2050 VLSB     |  MW  | 1830-2000 | Audio, Video & Projector |  Denied  |
  And I am on the ETS page

  Scenario: View & sort all submitted request for webcasts
    Then I should see requests for the following courses: "CS 169,CS 162,CS 189"
    And I follow "Time"
    Then I should see "CS 162" before "CS 189"
    And I follow "CCN"
    Then I should see "CS 162" before "CS 169"
    And I follow "Location"
    Then I should see "10 EVANS" before "245 LI KA SHING"

  Scenario: Filter submitted requests for webcasts
    Then I should see requests for the following courses: "CS 169,CS 162,CS 189"
    And I should see the following fields: "Building,Room,Time"
    When I select "VLSB" from "Building"
    And I select "2050" from "Room"
    And I press "Submit"
    Then I should see requests for the following courses: "CS 189"
    And I should not see requests for the following courses: "CS 162,CS 169"