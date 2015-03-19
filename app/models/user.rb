class User < ActiveRecord::Base
  include BCrypt

# getter method:
  def password
    @password ||= Password.new(password_hash)
  end

# setter method:
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
