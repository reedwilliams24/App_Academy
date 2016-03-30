# == Schema Information
#
# Table name: bills
#
#  id         :integer          not null, primary key
#  title      :string
#  author_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Bill < ActiveRecord::Base
  belongs_to :author,
    foreign_key: :author_id,
    primary_key: :id,
    class_name: "Senator"

  has_one :sponsoring_party,
    through: :author,
    source: :party

  has_many :bill_endorsements,
    foreign_key: :bill_id,
    primary_key: :id,
    class_name: "BillEndorsement"

  has_many :endorsing_senators,
    through: :bill_endorsements,
    source: :senator
end
