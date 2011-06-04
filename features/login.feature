Feature: Login

@31 @wip
Scenario: Verify error message when user with email address does not exist
  Given I am on the login page
  When I fill in the following:
    | email    | test@gmail.com |
    | password | p@ssw0rd       |
  And I submit the form
  Then I should see "Invalid email or password. Please try again." in the errors section
  Then I should be logged out


@31 @wip
Scenario: Verify error message when password is incorrect
  Given a user exists with email: "test@gmail.com", password: "p@ssw0rd"
  And I am on the login page

  When I fill in the following:
    | email    | test@gmail.com |
    | password | wrongpassword  |
  And I submit the form
  Then I should see "Invalid email or password. Please try again." in the errors section
  Then I should be logged out


@31 @wip
Scenario: Verify successful login
  Given a user exists with email: "test@gmail.com", password: "p@ssw0rd"
  And I am on the login page

  When I fill in the following:
    | email    | test@gmail.com |
    | password | p@ssw0rd  |
  And I submit the form
  And I should be on the home page
  Then I should be logged in


@31 @wip
Scenario: Verify login page is not accessible after successful login and the user should be redirected to home page
  Given a user exists with email: "test@gmail.com", password: "p@ssw0rd"
  And I am on the login page

  When I fill in the following:
    | email    | test@gmail.com |
    | password | p@ssw0rd  |
  And I submit the form
  And I should be on the home page
  Then I should be logged in
  When I go to the login page
  Then I should be on the home page