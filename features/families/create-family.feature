@javascript
Feature: Create family
  As an director
  I want to create families
  In order to add to families list

  Background:
	Given I am loged in like director
  And I click on family button
  And I click on create family button


  Scenario: Parameters ok
	When I fill family form with valid parameters
	Then I should see the new family in families list
	And  I should see family created message
