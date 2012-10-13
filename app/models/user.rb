class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible 	:email, :password, :password_confirmation, :remember_me, 
                    :username, :dni, :address, :relative_phone, :name, :last_name, :salary, :small_code, :role_ids, :store_id
  # attr_accessible :title, :body

  validates :username, :presence => true
  
  has_and_belongs_to_many :roles
  has_many :entry_folders
  has_many :output_folders
  belongs_to :store

  def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  end
end
