Feature: ETS page

  As a ETS staff
  So that I can see all webcast requests made by professors
  I want to see a list of all professor-made requests
  
#  Given the following requests exist:
#    | professor |  building  | room  | layout  |   date requested    |
#    | prof1     |  build1    | room1 | layout1 | 2007-01-18 06:10:17 |
#    | prof2     |  build2    | room2 | layout2 | 2007-01-18 07:10:17 |
#    | alex      |  Barrows   | 215   | layout1 | 2007-01-18 07:10:18 |
#    | alex      |  Barrows   | 101   | asdf    | 2007-01-18 04:10:17 |

  Scenario: See all submitted requests
    Given I am on the ETS page
    Then I should see a table named "Requests"
    And I should see a column named "Professor"
    And I should see a column named "Location"
    And I should see a column named "Request/Layout"
    And I should see a column named "Date Requested"
    And I should see a column named "Status"
#
#  Scenario: See all requests
#    Then I should see a "prof1"
#    And I should see a "prof2"
#
#  Scenario: Sort by professor
#    When I click on "Professor"
#    Then I should see "prof1" before "prof2"
#
#  Scenario: Sort by building and room
#    When I click on "Building"
#    Then I should see "Barrows" before "build2"
#    And I should see "101" before "215"
#
#  Scenario: Sort by layout
#    When I click on "Layout"
#    Then I should see "asdf" before "layout1"
#
#  Scenario: Sort by date added
#    When I click on "Date Submitted"
#    Then I should see "2007-01-18 04:10:17" before "2007-01-18 06:10:17"