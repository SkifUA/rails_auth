class User < ApplicationRecord

  # hash password
  has_secure_password

  # check role editor
  def editor?
    self.role == 'editor'
  end

  #check role admin
  def admin?
    self.role == 'admin?'
  end

end
