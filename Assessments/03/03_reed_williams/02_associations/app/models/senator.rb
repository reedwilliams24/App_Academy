# == Schema Information
#
# Table name: senators
#
#  id         :integer          not null, primary key
#  fname      :string
#  lname      :string
#  state      :string
#  party_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Senator < ActiveRecord::Base
  belongs_to :party,
    foreign_key: :party_id,
    primary_key: :id,
    class_name: "Party"

  has_one :desk,
    foreign_key: :owner_id,
    primary_key: :id,
    class_name: "Desk"

  has_many :committee_memberships,
    foreign_key: :senator_id,
    primary_key: :id,
    class_name: "CommitteeMembership"

  has_one :committee_chaired,
    foreign_key: :chairperson_id,
    primary_key: :id,
    class_name: "Committee"

  has_one :ideology,
    through: :party,
    source: :ideology

  has_one :party_led,
    foreign_key: :party_leader_id,
    primary_key: :id,
    class_name: "Party"

  has_many :committees,
    through: :committee_memberships,
    source: :committee

  has_many :chairpersons,
    through: :committees,
    source: :chairperson

  has_one :party_leader,
    through: :party,
    source: :party_leader
end
