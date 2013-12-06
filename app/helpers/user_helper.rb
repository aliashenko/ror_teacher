module UserHelper
  # Returns the full name for a user.
  def full_name(user)
    "#{user.first_name} #{user.last_name}"
  end
end
