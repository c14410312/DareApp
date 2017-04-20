class DareRoom < ApplicationRecord
  belongs_to :user
  mount_uploader :proof, VideoUploader

  def set_success(format, opts)
    self.success = true
  end

  def accept_dare!
  	self.isSelected = true;
  	self.accepted = true;
  	self.save
  end

  def decline_dare!
  	self.isSelected = true;
  	self.accepted = false;
  	self.save
  end
  
end
