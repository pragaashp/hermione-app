Feature: Login and authentication via CalNet.

  As a professor or a member of the ETS
  So that I can view my requests
  I want to log in to via CalNet to access the application
	
 Scenario: login to user's respective dashboard
    Given I am on the home page
    When I follow "Sign In" and I get redirected
    And I should be on the CalNet authentication page
    And I should see "You are being redirected."
