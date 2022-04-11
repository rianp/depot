class Product < ApplicationRecord
    validates :title, :description, :image_url, presence: true
    validates :title, uniqueness: true

    validates :image_url, allow_blank: true, format: { 
              with: %r{\.(gif|jpg|png)\z}i,
              message: 'must be a URL for GIF, JPG or PNG image.'
    }
    belongs_to :user
    has_many :comments, dependent: :destroy
end
