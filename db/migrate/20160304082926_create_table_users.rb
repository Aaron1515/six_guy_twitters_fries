class CreateTableUsers < ActiveRecord::Migration
  def change

  	create_table :users do |t|
  		
  		t.string :username
  		t.string :digest_password
  		t.string :email 
  		t.string :bio

  		t.timestamps
  	end
  end
end
