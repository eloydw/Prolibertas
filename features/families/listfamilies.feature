@javascript
Feature: Family
  As an director
  I want to see families list


  Scenario: Families list
    Given There are 3 families in the platform
    Given I am loged in like director
    When I click on button family
    Then I should see the list of the families
