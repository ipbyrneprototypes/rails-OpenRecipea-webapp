class Recipe < ActiveRecord::Base
    searchkick
    acts_as_votable
    belongs_to :user
    belongs_to :category
    belongs_to :privacy
    
    has_many :ingredients
    has_many :directions
    has_many :reviews
    accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true
    accepts_nested_attributes_for :directions, :reject_if => :all_blank, :allow_destroy => true
    
  
    
  
    validates :title, :description, :image, :privacy_id, :category_id, presence: true
    has_attached_file :image, :styles => { :medium => "400x400#", :thumb => "100x100#" }
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
    
end
