class Contact < ActiveRecord::Base
  
    # self.table_name = "contact_tables" 
    attr_accessor :first_name     
    validates :first_name , :last_name , :email , :present_address , :permanent_address,
    :about , :profile_img , :facebook_link , :google_link , :twitter_link , 
        :cover_pic,  presence: true
    
    validates :first_name , :last_name, length: {minimum:2 , maximum: 20}
    
    validates :email, format: { with: /[a-z]+@[a-z]+\.[a-z]+/}

    validates :present_address , :permanent_address, length: {minimum:5 , maximum:50 }
    
    
    
    validates :about, length: {minimum:2 , maximum: 1500}

    validates :profile_img , :cover_pic, format: {with: /\.[jpg]|[png]|[gif]/}

    validates :facebook_link , :google_link , :twitter_link , length: {minimum:5} 

    

end
