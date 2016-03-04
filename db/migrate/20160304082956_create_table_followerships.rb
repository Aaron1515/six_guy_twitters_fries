class CreateTableFollowerships < ActiveRecord::Migration
  def change
  	create_table :followerships do |t|

  		t.integer :followee_id
  		t.integer :follower_id
  	end
  	add_index :followerships, :follower_id
    add_index :followerships, :followee_id
    add_index :followerships, [:follower_id, :followee_id], unique: true
  end

end
