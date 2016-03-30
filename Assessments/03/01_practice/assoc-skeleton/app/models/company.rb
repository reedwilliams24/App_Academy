class Company < ActiveRecord::Base
  has_many :prices,
    foreign_key: :company_id,
    primary_key: :id,
    class_name: "Price"

  belongs_to :exchange,
    foreign_key: :exchange_id,
    primary_key: :id,
    class_name: "Exchange"

  has_many :watch_list_items,
    foreign_key: :company_id,
    primary_key: :id,
    source: "WatchListItem"

  has_many :watch_lists,
    through: :watch_list_items,
    source: :watch_list

  has_many :watchers,
    through: :watch_lists,
    source: :user

  has_one :board,
    foreign_key: :company_id,
    primary_key: :id,
    class_name: "Board"

end
