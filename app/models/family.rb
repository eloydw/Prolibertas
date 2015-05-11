class Family
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,                type: String
  field :surname,             type: String
  field :origin,              type: String
  field :menu,                type: String
  field :genre,               type: Symbol
  field :phone,               type: String
  field :adults,              type: Integer
  field :children,            type: Integer
  field :center,              type: String
  field :socialworker,        type: String
  field :type_of_income,      type: String
  field :amount_of_income,    type: Float
  field :address_type,        type: String
  field :address,             type: String
  field :assistance,          type: Date
  field :nif,                 type: String

  has_many :used_services
  has_many :alerts

  validates :name,                 presence: true
  validates :surname,              presence: true
  validates :adults,               presence: true
  validates :children,             presence: true
  validates :center,               presence: true
  validates :genre, inclusion: {in: [:man, :woman]}
end
