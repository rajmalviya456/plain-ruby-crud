require_relative './user'

class UsersDB
  attr_accessor :incr_id, :users

  def initialize
    self.users = []
    self.incr_id = 0
  end

  def add(user_info)
    user = User.new(user_info.merge(id: next_id))
    users << user
    user
  end

  def list
    users
  end

  def find(id)
    user_by_id(id)
  end

  def delete(id)
    user = user_by_id(id)
    return unless user

    users.delete(user)
  end

  def update(id, user_info)
    user = user_by_id(id)
    return unless user

    user.name = user_info[:name] if user_info[:name]
    user.email = user_info[:email] if user_info[:email]
    user.phone = user_info[:phone] if user_info[:phone]
    user
  end

  private

  def user_by_id(id)
    users.find { |user| user.id == id }
  end

  def next_id
    self.incr_id += 1
  end
end

################################################################
########################## Test Data ###########################
################################################################

users_db = UsersDB.new

puts '# Adding new user'
pp users_db.add(name: 'u1', email: 'u1@example.com', phone: '1111111111')
pp users_db.add(name: 'u2', email: 'u2@example.com', phone: '2222222222')
pp users_db.add(name: 'u3', email: 'u3@example.com', phone: '3333333333')
pp users_db.add(name: 'u5', email: 'u5@example.com', phone: '5555555555')
pp users_db.add(name: 'u4', email: 'u4@example.com', phone: '4444444444')

puts "\n# Find user"
user = users_db.find(2)
pp user

puts "\n# List all users"
pp users_db.list

puts "\n# Delete user"
pp users_db.delete(3)

puts "\n# Update user"
pp users_db.update(4, { name: 'u-updated', email: 'u-updated@example.com' })

puts "\n# Find user"
user = users_db.find(4)
pp user
