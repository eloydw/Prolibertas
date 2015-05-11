Given(/^There are (\d+) families in the platform$/) do |amount|
  FactoryGirl.create_list(:family, amount.to_i)
end

When(/^I click on button family$/) do
  page.find("#familiasButton").click
end

Then(/^I should see the list of the families$/) do
  expect(page).to have_css "#familiesTable"
  Family.each do |family|
    expect(page).to have_css "tr#family_#{family.id} td:nth-child(1)", text: family.name
    expect(page).to have_css "tr#family_#{family.id} td:nth-child(2)", text: family.surname
    expect(page).to have_css "tr#family_#{family.id} td:nth-child(3)", text: family.origin
    expect(page).to have_css "tr#family_#{family.id} td:nth-child(4)", text: family.adults
    expect(page).to have_css "tr#family_#{family.id} td:nth-child(5)", text: family.children
    expect(page).to have_css "tr#family_#{family.id} td:nth-child(6)", text: family.menu
  end

end

#Test para crear Familias

Given(/^I click on family button$/) do
  page.find("#familiasButton").click
end

Given(/^I click on create family button$/) do
  page.find("#createFamily").click
end

sleep 3

When(/^I fill family form with valid parameters$/) do
  parametros = FactoryGirl.attributes_for(:family)
  fill_in 'InputName', with: parametros[:name]
  fill_in 'InputNif', with: parametros[:nif]
  fill_in 'InputSurname', with: parametros[:surname]
  fill_in 'InputAdults', with: parametros[:adults]
  fill_in 'InputChildren', with: parametros[:children]
  if parametros[:genre] == :man
    select('Hombre', from: 'InputGenre')
  else
    select('Mujer', from: 'InputGenre')
  end
  fill_in 'InputOrigin', with: parametros[:origin]
  fill_in 'InputMenu', with: parametros[:menu]
  fill_in 'InputCenter', with: parametros[:center]
  fill_in 'InputSocialworker', with: parametros[:socialworker]
  fill_in 'InputAssistance', with: parametros[:assistance]
  fill_in 'InputAddressType', with: parametros[:address_type]
  fill_in 'InputTypeOfIncome', with: parametros[:type_of_income]
  fill_in 'InputAmountOfIncome', with: parametros[:amount_of_income]
  fill_in 'InputAddress', with: parametros[:address]
  fill_in 'InputPhone', with: parametros[:phone]
  click_button 'InputSubmit'
end

Then(/^I should see the new family in families list$/) do
  expect(page).to have_css "#familiesTable"

  family = Family.last
  expect(page).to have_css "tr#family_#{family.id} td:nth-child(1)", text: family.name
  expect(page).to have_css "tr#family_#{family.id} td:nth-child(2)", text: family.surname
  expect(page).to have_css "tr#family_#{family.id} td:nth-child(3)", text: family.origin
  expect(page).to have_css "tr#family_#{family.id} td:nth-child(4)", text: family.adults
  expect(page).to have_css "tr#family_#{family.id} td:nth-child(5)", text: family.children
  expect(page).to have_css "tr#family_#{family.id} td:nth-child(6)", text: family.menu
end

Then(/^I should see family created message$/) do
  expect(page).to have_css ".leo-message", text:"¡Ha creado satisfactoriamente una nueva familia!"
end
