class User < ActiveRecord::Base
  searchkick
  acts_as_voter
  acts_as_votable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
    has_many :recipes
    has_many :reviews, dependent: :destroy
  

  
    has_attached_file :avatar, :styles => { :medium => "200x200#", :thumb => "100x100#", :small => "25x25#"}
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
