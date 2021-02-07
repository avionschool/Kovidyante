class Answer < ApplicationRecord
  belongs_to :homework

  mount_uploader :attachment, AttachmentUploader
  validates :name, presence: true 
end
