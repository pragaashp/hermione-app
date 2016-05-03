Feature: Create, Update, Read & Delete Requests

  As a professor and/or faculty member of UC Berkeley
  So that I can make and modify requests for webcasting of my classes
  I want to view my classes, submit webcast request and check their status

  Scenario: Create a new webcast request for a class
    Given that professor "Professor A" exists
    Given I am on the professor page for "Professor A"
    Then I should see the following fields: "Course Control Number,Title,Abbreviation,Location,Days,Start Time,End Time,Format,Comments"
    And I fill in "course[abbreviation]" with "CS 169"
    And I check "Lecture with Slides" for request format
    And I press "Submit"
    Then I should be on the professor page for "Professor A"
    And I should see "CS 169"
    And I should see "Lecture with Slides"
    And I should see "Pending"

  Scenario: Edit a previously created webcast request
    Given the following requests exist:
      |  CCN   |  Abbreviation  |  Professor  |    Location     | Days |   Time    |         Format          |  Status  |
      | 16903  |     TC 103     | Professor A |    10 EVANS     | TuTh | 1530-1700 |   Lecture with Slides   | Pending  |
    And I am on the professor page for "Professor A"
    And I should see "TC 103"
    Then I should see the following fields: "Course Control Number,Title,Abbreviation,Location,Days,Start Time,End Time,Format,Comments"
    And I uncheck "Lecture with Slides" for request format
    And I check "Basic Lecture" for request format
    And I press "Submit" in "edit-course-form"
    Then I should be on the professor page for "Professor A"
    And I should not see "Lecture with Slides" in "req-container"
    And I should see "Basic Lecture" in "req-container"

  Scenario: Delete a previously created webcast request
    Given the following requests exist:
      |  CCN   |  Abbreviation  |  Professor  |    Location     | Days |   Time    |         Format          |  Status  |
      | 16903  |     TC 103     | Professor A |    10 EVANS     | TuTh | 1530-1700 |   Lecture with Slides   | Pending  |
    And I am on the professor page for "Professor A"
    And I should see "TC 103"
    When I follow "Delete"
    Then I should be on the professor page for "Professor A"
    And I should not see "TC 103"

