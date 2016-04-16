Feature: Create, Update, Read & Delete Requests

  As a professor and/or faculty member of UC Berkeley
  So that I can make and modify requests for webcasting of my classes
  I want to view my classes, submit webcast request and check their status

  Scenario: Create a new webcast request for a class
    Given I am on the professor page for "Armando Fox"
    And I press the request button: "New Webcast Request"
    Then I should see the following fields: CCN,Title,Location,Days,Request
    And I fill in the following:
      | CCN      |        26619      |
      | Title    |       CS 169      |
      | Location |      10 EVANS     |
      | Days     |        TuTh       |
      | Request  | Audio & Projector |
    And I press the request button: "Submit New Request"
    Then I should be on the professor page
    And I should see "CS 169,TuTh,10 EVANS,Audio & Projector"

  Scenario: Edit a previously created webcast request
    Given I am on the professor page for "Armando Fox"
    And the following requests exist:
    |  CCN   |  Title  |  Professor  |    Location     | Days |   Time    |         Request          |  Status  |
    | 26619  |  CS 169 | Armando Fox |    10 EVANS     | TuTh | 1530-1700 |    Audio & Projector     |    0     |
    When I press the request button: "Edit Request"
    And I should see "CS 169"
    Then I should see the following fields: CCN,Title,Location,Days,Request
    And I fill the field "Request" with "Audio, Video & Projector"
    And I press the request button: "Submit Edit Request"
    Then I should be on the professor page
    And I should see "Audio, Video & Projector"
    And I should not see "Audio & Projector"

  Scenario: Delete a previously created webcast request
    Given I am on the professor page
    Given the following requests exist:
      | CCN      |        26619      |
      | Title    |       CS 169      |
      | Location |      10 EVANS     |
      | Days     |        TuTh       |
      | Request  | Audio & Projector |
      | Status   |      Approved     |
    And I should see "CS 169"
    When I follow the delete button
    Then I should be on the professor page for "Armando Fox"
    And I should not see the request

