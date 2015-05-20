@javascript
Feature: Edit family
  As an director
  I want to edit family
  In order to update data

Background:
  Given There is 1 family in the platform
  Given I am loged in like director
  Given I visit family page
  Given I click the view icon of a family in families list view
  Given I should go to a view of this family
