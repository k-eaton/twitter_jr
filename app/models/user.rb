class User < ActiveRecord::Base

  has_many :tweets

  include BCrypt
  validates :email, :handle, presence:true
  validate :correct_email_format
# getter method:
  def password
    @password ||= Password.new(password_hash)
  end

# setter method:
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(input_password)
    self.password == input_password
  end

  def correct_email_format
    self.errors.add :base, "Incorrect email address format" unless /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i.match(self.email)
  end


end
