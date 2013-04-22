class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible 	:email, #
                    :password, #
                    :password_confirmation, #
                    :remember_me, #
                    :username, #
                    :dni, #
                    :address, #
                    :relative_phone, #
                    :name, # 
                    :last_name, #
                    :salary, #
                    :small_code, #
                    :role_ids, #
                    :store_id, #
                    :image
                    
  # attr_accessible :title, :body

  validates :username, :presence => true
  validates :email, :uniqueness => true
  validates :dni, :uniqueness => true
  
  has_and_belongs_to_many :roles
  has_many :entry_folders
  has_many :output_folders
  has_many :quotations
  has_many :notifications
  
  belongs_to :store

  has_attached_file :image, :styles => {
    :medium => "100x100>",
    :large => "300x300>"
  }, 
  :path => ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
  :url => "/system/:class/:attachment/:id/:style/:filename", :dependent => :destroy

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

  def full_name
    name.split(" ")[0] + " "+ last_name.split(" ")[0]
  end

  def update_with_password(params={}) 
    if params[:password].blank? 
      params.delete(:password) 
      params.delete(:password_confirmation) if params[:password_confirmation].blank? 
    end 
    update_attributes(params) 
  end
end
