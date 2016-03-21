class AddAttachmentProfileImgCoverPicToContacts < ActiveRecord::Migration
  def self.up
    change_table :contacts do |t|
      t.attachment :profile_img
      t.attachment :cover_pic
    end
  end

  def self.down
    remove_attachment :contacts, :profile_img
    remove_attachment :contacts, :cover_pic
  end
end
