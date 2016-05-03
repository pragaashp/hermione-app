Feature: Create, Update, Read & Delete Requests

  As a professor and/or faculty member of UC Berkeley
  So that I can make and modify requests for webcasting of my classes
  I want to view my classes, submit webcast request and check their status

  Scenario: Create a new webcast request for a class
    Given I am on the professor page for "Armando Fox"
    Then I should see the following fields: "Course Control Number,Title,Abbreviation,Location,Days,Start Time,End Time,Format,Comments"
    And I fill in the following:
      | CCN      |        26619      |
      | Title    |       CS 169      |
      | Location |      10 EVANS     |
      | Days     |        TuTh       |
      | Time     |     1530-1700     |
      | Request  | Audio & Projector |
    And I press "Submit"
    Then I should be on the professor page
    And I should see the following: "CS 169,TuTh,10 EVANS,Audio & Projector"

  Scenario: Edit a previously created webcast request
    Given the following requests exist:
      |  CCN   |  Title  |  Professor  | Location | Days |   Time    |     Request       |  Status  |
      | 26619  |  CS 169 | Armando Fox | 10 EVANS | TuTh | 1530-1700 | Audio & Projector | Approved |
    And I am on the professor page for "Armando Fox"
    And I should see "CS 169"
    When I follow "Edit Request"
    Then I should see the following fields: "CCN,Title,Location,Days,Time,Request"
    And I fill in "Request" with "Audio, Video & Projector"
    And I press "Submit"
    Then I should be on the professor page
    And I should see "Audio, Video & Projector"
    And I should not see "Audio & Projector"

  Scenario: Delete a previously created webcast request
    Given the following requests exist:
      |  CCN   |  Title  |  Professor  | Location | Days |   Time    |     Request       |  Status  |
      | 26619  |  CS 169 | Armando Fox | 10 EVANS | TuTh | 1530-1700 | Audio & Projector | Approved |
    And I am on the professor page for "Armando Fox"
    And I should see "CS 169"
    When I follow "Delete Request"
    Then I should be on the professor page
    And I should not see "CS 169"

