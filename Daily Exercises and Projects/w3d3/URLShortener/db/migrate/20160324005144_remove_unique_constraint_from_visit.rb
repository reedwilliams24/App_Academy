class RemoveUniqueConstraintFromVisit < ActiveRecord::Migration
  def change
    remove_index(:visits, column: :shortened_url_id)
    add_index "visits", "shortened_url_id", name: "index_visits_on_shortened_url_id"
  end
end
