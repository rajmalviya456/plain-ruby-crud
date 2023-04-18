class User
  attr_accessor :id, :name, :email, :phone

  def initialize(user_info)
    @id = user_info[:id]
    @name = user_info[:name]
    @email = user_info[:email]
    @phone = user_info[:phone]
  end
end
