class AddMediasToUser < ActiveRecord::Migration
  def change
    add_column :users, :facebook, :string
    add_column :users, :github, :string
    add_column :users, :google, :string
    add_column :users, :twitter, :string
    add_column :users, :twitch, :string
    add_column :users, :snapchat, :string
    add_column :users, :youtube, :string
    add_column :users, :tripadvisor, :string
    add_column :users, :linkedin, :string
    add_column :users, :instagram, :string
  end
end
