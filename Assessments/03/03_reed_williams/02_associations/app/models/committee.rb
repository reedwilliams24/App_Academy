# == Schema Information
#
# Table name: committees
#
#  id             :integer          not null, primary key
#  name           :string
#  mandate        :string
#  chairperson_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Committee < ActiveRecord::Base
  has_many :memberships,
    foreign_key: :committee_id,
    primary_key: :id,
    class_name: "CommitteeMembership"

  belongs_to :chairperson,
    foreign_key: :chairperson_id,
    primary_key: :id,
    class_name: "Senator"

  has_many :senators,
    through: :memberships,
    source: :senator
end
