FactoryGirl.define do
  factory :family do
    name { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    origin { Faker::Address.country }
    menu { [:standar, :muslim].sample }
    genre { [:man, :woman].sample }
    phone { Faker::PhoneNumber.cell_phone }
    adults { rand(1...3) }
    children { rand(1...5) }
    center { ['Norte', 'Levante', 'Fuensanta', 'Ribera',
      'Poniente Sur', 'Poniente Norte', 'Moreras', 'Periferia', 'Lucena'].sample  }
    socialworker { Faker::Name.name}
    type_of_income { ['Nómina', 'Ayuda', 'PER'].sample }
    amount_of_income {  rand(100...700).to_f }
    address_type { ['Alquilado', 'Ocupado', 'Familiares', 'Dación en pago'].sample }
    address { Faker::Address.street_address }
    assistance { Faker::Date.between(3.months.ago, 1.months.ago) }
    nif { Faker::Number.number(8) }
  end

  # Sólo se debe usar con attributes_for
  factory :family_update, parent: :family do
    name "A new name"
    surname "A new surname"
    origin "A new origin"
    menu "A new menu"
    genre [:man, :woman].sample
    phone "A new phone"
    number_of_adult 3
    number_of_children 7
    social_worker "A new social_worker"
    type_of_income "A new type_of_income"
    amount_of_income 850.0
    address "A new address"
    address_type "A new address_type"
    assistance { Faker::Date.between(3.months.ago, 1.months.ago) }
    nif "A new nif"
  end
end
