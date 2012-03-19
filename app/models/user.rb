class User < ActiveRecord::Base
  RESTRICTED_ALIASES = %w(sign_in sign_out sign_up users tasks about contact contact_us admin)

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :alias_name

  has_assignments
  belongs_to :personal_task_list, :class_name => 'TaskList'
  has_and_belongs_to_many :task_lists

  validates :first_name, :presence => true, :length => {:maximum => 255}
  validates :last_name, :presence => true, :length => {:maximum => 255}
  validates :alias_name, :presence => true,
                         :length => {:maximum => 255},
                         :uniqueness => {:case_sensitive => false},
                         :exclusion => {:in => RESTRICTED_ALIASES}

  after_create do
    self.create_personal_task_list :name => self.alias_name
    self.save!
  end

  def to_param
    persisted? ? alias_name.downcase : nil
  end

  def self.find(id, options={})
    begin
      super(id, options)
    rescue ActiveRecord::RecordNotFound
      where(['lower(alias_name) = ?', id.downcase]).first
    end
  end
end

