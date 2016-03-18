class Contact < ActiveRecord::Base
  
    # self.table_name = "contact_tables" 
    attr_accessor :first_name     
    validates :first_name , presence: true 

end
