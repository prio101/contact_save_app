class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact = Contact.find(params[:id]) 
    respond_to do |format|
        format.html
        format.pdf do
            contact_pdf = Prawn::Document
            pdf = contact_pdf.new 
            
            
            
            pdf.text  "Contact Details" , style: :bold , top: 70 , font_size: 300
            pdf.text  "Contact details of the #{@contact.last_name}"
            pdf.text  "Contact Names : #{@contact.first_name} #{@contact.last_name}"
            pdf.text  "Email: #{@contact.email}"
              
            
            
            send_data pdf.render , filename: "contact-details of #{@contact.last_name}.pdf",
                                    type: "application/pdf",
                                    disposition: "inline"

        end
    end
  end


  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.json
  def create
      
      
    @contact = Contact.new(contact_params)

  #  @contact.save
  #  redirect_to @contact

   respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
      
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.fetch(:contact , {}).permit( :first_name , :last_name , :email , 
                                         :present_address , :permanent_address , 
                                         :profile_img , :about , :facebook_link , 
                                     :google_link , :twitter_link , :cover_pic)
      
    end
    
    
    def pdf_header
        
        puts "Contact Of the #{@contact.last_name}"
    end
    
end
