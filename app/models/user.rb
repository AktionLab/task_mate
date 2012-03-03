class User < ActiveRecord::Base
  RESTRICTED_ALIASES = %w(sign_in sign_out sign_up users tasks about contact contact_us admin)

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :alias_name

  has_many :assignments, :as => :assignable, :dependent => :delete_all
  has_many :tasks, :through => :assignments

  validates :first_name, :presence => true, :length => {:maximum => 255}
  validates :last_name, :presence => true, :length => {:maximum => 255}
  validates :alias_name, :presence => true,
                         :length => {:maximum => 255},
                         :uniqueness => {:case_sensitive => false},
                         :exclusion => {:in => RESTRICTED_ALIASES}
end

