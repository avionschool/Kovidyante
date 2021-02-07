class Homework < ApplicationRecord

    has_many :answers

    mount_uploader :attachment, AttachmentUploader
    validates :name, presence: true 
end
