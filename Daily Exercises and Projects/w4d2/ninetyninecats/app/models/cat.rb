class Cat < ActiveRecord::Base
  has_many :requests,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest

  COLORS = %w(black white tan brown grey orange)

  validates :birth_date, :color, :name,
    :sex, :description, presence: true

  validates :sex, inclusion:{ in: ['M', 'F']}

  validates :color, inclusion:{ in: COLORS}


  def self.colors
    COLORS
  end


  def age
    days_old = (Date.today - self.birth_date).to_i
    days_old/365
  end



end
