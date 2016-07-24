def login_user(user)
  login_as user, scope: :user # warden test login
  visit root_path # simulate redirect to root path
end

def login_admin(admin)
  login_as admin, scope: :admin
  visit root_path
end
