class AddCatTimestamps < ActiveRecord::Migration
  def change
    add_column :cats, :created_at, :time
    add_column :cats, :updated_at, :time
  end
end
