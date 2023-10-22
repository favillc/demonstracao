Feature: Login

  I want to login on Swag Labs

  Background:
    Given I go to 'v1/index.html'
    And the field 'username' is empty
    And the field 'password' is empty

  Scenario: Error on empty fields
    When I click on 'enter'
    Then field 'username' should be with error
    And field 'password' should be with error

  Scenario: Wrong password
    When I type 'standard_user' in 'username'
    And I type '123456' in 'password'
    And I click on 'enter'
    Then I should see 'Username or password is incorrect'

  Scenario: Wrong username
    When I type 'strange_user' in 'username'
    And I type 'secret_sauce' in 'password'
    And I click on 'enter'
    Then I should see 'Username or password is incorrect'

  Scenario: Login successfully
    Given I have users:
      | name           | username             | password       |
      | Vitor Batista  | standard_user        | secret_sauce   |
    When I type 'standard_user' in 'username'
    And I type 'secret_sauce' in 'password'
    And I click on 'enter'
    Then I shoul see 'Products'