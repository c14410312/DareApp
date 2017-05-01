class DareRoom < ApplicationRecord
  belongs_to :user
  belongs_to :sent_to, :class_name => User, :foreign_key => :sent_to_id
  has_one :videos
  mount_uploader :proof, ProofUploader

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

  def approve_proof!
    self.proof_approved = true;
    self.save
  end

  def public_proof!
    self.publish_proof = true;
    self.save
  end

  def private_proof!
    self.publish_proof = false;
    self.save
  end

  def unapprove_proof!
    self.proof_approved = false;
    self.save
  end

  private
    def image_size_validation
      errors[:proof] << "should be less than 500KB" if proof.size > 0.5.megabytes
    end

  
end
