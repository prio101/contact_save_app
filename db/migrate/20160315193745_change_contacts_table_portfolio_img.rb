class ChangeContactsTablePortfolioImg < ActiveRecord::Migration
    
  def change
    change_table :contacts do |t|
     t.rename :portfolio_img , :profile_img
     
     
    end
  
  end
end
