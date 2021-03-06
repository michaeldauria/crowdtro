Feature: User is required to log in with google apps
  In order to keep our concerns private
  A visitor must log in with google apps

  Scenario: Visitor must log in with google apps
    Given I am on the site
    Then I should not see the new concern form
    And I should see "Google Apps" within the page
    When I log in as:
      | first_name | last_name | email              |
      | Steve      | Shin      | steve@crowdtap.com |
    And I go to the homepage
    Then I should see the new concern form
    When I click "Logout"
    Then I should be on the login path
    And I should see "Google Apps" within the page
    But I should not see the new concern form
