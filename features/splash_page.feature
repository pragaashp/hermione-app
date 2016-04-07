Feature: display collection of videos on splash page

  As a visitor
  So that I can learn more about Project Hermione
  I want to see video demos of using Hermione

  Scenario: splash page with demo videos
    # Change the video titles when necessary.
    Given I am on the home page
    When I follow the "Configuring Courses" video thumbnail
    Then I should see a video titled "Configuring Courses"
    When I follow the "Organizing Courses" video thumbnail
    Then I should see a video titled "Organizing Courses"
    When I follow the "Editing Webcasts" video thumbnail
    Then I should see a video titled "Editing Webcasts"