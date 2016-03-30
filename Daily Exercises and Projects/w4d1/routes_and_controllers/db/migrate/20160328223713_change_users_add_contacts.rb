class ChangeUsersAddContacts < ActiveRecord::Migration
  def change
    remove_column :users, :name
    remove_column :users, :email

    add_column :users, :username, :string

    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :user_id, null: false
    end

    add_index :contacts, [:user_id, :email], unique: true
    add_index :contacts, :user_id

    create_table :contact_shares do |t|
      t.integer :contact_id, null: false
      t.integer :user_id, null: false
    end

    add_index :contact_shares, [:contact_id, :user_id], unique: true
    add_index :contact_shares, :contact_id
    add_index :contact_shares, :user_id
  end
end
