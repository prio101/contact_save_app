class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      
      t.string   :first_name
      t.string   :last_name
      t.string   :email
      t.integer  :phone
      t.string   :present_address
      t.string   :permanent_address
      t.text     :about
      t.string   :facebook_link
      t.string   :google_link
      t.string   :twitter_link
      t.string   :portfolio_img
      t.string   :cover_pic

      t.timestamps null: false
    end
  end
end
