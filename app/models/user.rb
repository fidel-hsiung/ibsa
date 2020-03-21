class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email

  TABLE_HEADS = ['Email', 'First Name', 'Last Name']
  TABLE_BODYS = ['email', 'first_name', 'last_name']

  def full_name
  	"#{first_name} #{last_name}"
  end
end
