class BoardMembership < ActiveRecord::Base
  belongs_to :board,
    foreign_key: :board_id,
    primary_key: :id,
    class_name: "Board"

  belongs_to :member,
    foreign_key: :member_id,
    primary_key: :id,
    class_name: "Executive"
end