Feature: User registration
  Scenario Outline: nnm-club.me registration
    Given I'm on "http://nnm-club.me/forum/profile.php?mode=register&agreed=true&agreed=true" page
    When I input "<Name>", "<Email>", "<Password>", "<Confirm password>"
    And check I agree with conditions
    And I wait for 5 seconds
    And click button Submit

    Then I should be successfuly registrated

   Examples:
    | Name             | Email           | Password         | Confirm password |
    | Your name        | Your email      | Your password    | Your password    |
