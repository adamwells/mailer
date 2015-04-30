class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
    	t.string :to
    	t.text :body
    	t.string :subject

      t.timestamps
    end
  end
end
