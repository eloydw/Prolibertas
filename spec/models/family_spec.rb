require 'rails_helper'
RSpec.describe Family, type: :model do
  context "Document" do
    it { is_expected.to be_timestamped_document }
  end
  context "Fields" do
    it { is_expected.to have_field(:name).of_type(String) }
    it { is_expected.to have_field(:surname).of_type(String) }
    it { is_expected.to have_field(:origin).of_type(String) }
    it { is_expected.to have_field(:menu).of_type(String) }
    it { is_expected.to have_field(:genre).of_type(Symbol) }
    it { is_expected.to have_field(:phone).of_type(String) }
    it { is_expected.to have_field(:number_of_adult).of_type(Integer) }
    it { is_expected.to have_field(:number_of_children).of_type(Integer) }
    it { is_expected.to have_field(:center_of_origin).of_type(String) }
    it { is_expected.to have_field(:social_worker).of_type(String) }
    it { is_expected.to have_field(:type_of_income).of_type(String) }
    it { is_expected.to have_field(:amount_of_income).of_type(Float) }
    it { is_expected.to have_field(:address_type).of_type(String) }
    it { is_expected.to have_field(:address).of_type(String) }
    it { is_expected.to have_field(:permit_assistance).of_type(Date) }
    it { is_expected.to have_field(:nif).of_type(String) }
  end

  context "Relations" do
    it { is_expected.to have_many(:used_services) }
    it { is_expected.to have_many(:alerts) }
  end

  context "Validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:surname) }
    it { is_expected.to validate_presence_of(:number_of_adult) }
    it { is_expected.to validate_presence_of(:number_of_children) }
    it { is_expected.to validate_presence_of(:center_of_origin) }
    it { is_expected.to validate_inclusion_of(:genre).to_allow([:man, :woman]) }
  end
end
