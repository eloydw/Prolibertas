Given(/^There is (\d+) family in the platform$/) do |amount|
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

# FAMILY SHOW

Given(/^I click on family button$/) do
  page.find("#familiasButton").click
end
 sleep 3

When(/^I click the view icon of a family in families list view$/) do
  familia = Family.first
  page.find("#family-show-#{familia.id}").click
end

Then(/^I should go to a view of this family$/) do
  expect(page).to have_css "#family-show-page"
end

#Test de Editar familia

Given(/^I visit family page$/) do
  page.find("#familiasButton").click
end

Given(/^I click the view icon of a family in families list view$/) do
  expect(page).to have_css "#family-show-page"
end

When(/^I click the edit button$/) do
  page.find(".familia__botones__edit").click
end

Then(/^I should see the edit form family$/) do
 expect(page).to have_css "#familyform"
end

Then(/^I should see the family information in the form$/) do
  @family = Family.first
  find_field('InputName').value.should eq @family.name
  find_field('InputSurname').value.should eq @family.surname
  find_field('InputNif').value.should eq @family.nif
  find_field('InputGenre').value.should eq @family.genre.to_s
  find_field('InputSocialServices').value.should eq @family.social_services
  find_field('InputPhone').value.should eq @family.phone
  find_field('InputOrigin').value.should eq @family.origin
  find_field('InputMenu').value.should eq @family.menu
  find_field('InputAssistance').value.should eq @family.assistance
  find_field('InputIncome').value.should eq @family.income
  find_field('InputHome').value.should eq @family.home
  find_field('InputAddress').value.should eq @family.address
  find_field('InputFamilyStatus').value.should eq @family.family_status
  find_field('InputContactFamily').value.should eq @family.contact_family
  find_field('InputHealthStatus').value.should eq @family.health_status
  find_field('InputNotes').value.should eq @family.notes
end


When(/^I update the form$/) do
  @family = Family.first
  page.find("#family-edit-#{@family.id}").click
  fill_in 'InputName', with: "pepe"
  fill_in 'InputSurname', with: "gonzalez"
  fill_in 'InputNif', with: "23423423s"
  fill_in 'InputSocialServices', with: "prolibertas"
  fill_in 'InputPhone', with: "345345343"
  fill_in 'InputOrigin', with: "congo"
  fill_in 'InputMenu', with: "musulman"
  fill_in 'InputAssistance', with: "asiste muchisimo"
  fill_in 'InputIncome', with: "ninguno"
  fill_in 'InputHome', with: "debajo del puente"
  fill_in 'InputAddress', with: "lo mismo"
  fill_in 'InputFamilyStatus', with: "ninguno"
  fill_in 'InputContactFamily', with: "ninguna familya"
  fill_in 'InputHealthStatus', with: "esta genial"
  fill_in 'InputNotes', with: "este hombre es un maquina"
  page.find("#InputSubmit").click
end

Then(/^I should see the family updated$/) do
  expect(page).to have_css "#family-edit-#{@family.id}"
  expect(page).to have_css "#family_name", text: "pepe"
  expect(page).to have_css "#family_surname", text: "gonzalez"
  expect(page).to have_css "#family_nif", text: "23423423s"
  expect(page).to have_css "#family_social", text: "prolibertas"
  expect(page).to have_css "#family_phone", text: "345345343"
  expect(page).to have_css "#family_origin", text: "congo"
  expect(page).to have_css "#family_menu", text: "musulman"
  expect(page).to have_css "#family_assistance", text: "asiste muchisimo"
  expect(page).to have_css "#family_income", text: "ninguno"
  expect(page).to have_css "#family_home", text: "debajo del puente"
  expect(page).to have_css "#family_address", text: "lo mismo"
  expect(page).to have_css "#family_family", text: "ninguno"
  expect(page).to have_css "#family_contact", text: "ninguna familya"
  expect(page).to have_css "#family_health", text: "esta genial"
  expect(page).to have_css "#family_notes", text: "este hombre es un maquina"
end
