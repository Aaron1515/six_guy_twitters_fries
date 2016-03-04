class CreateTableTweets < ActiveRecord::Migration
  def change

  	create_table :tweets do |t|

  		t.references :user
  		t.string :content
  		t.timestamps 
  	end
  end
end
