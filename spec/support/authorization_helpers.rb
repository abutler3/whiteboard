module AuthorizationHelpers
  def assign_role!(user, role, project)
    Role.where(user: user, project: project).delete_all
    Role.create!(user: user, role: role, project: project)
    # creates a new instance of a Role model to
    # link together the user, a name of a role,
    # and a project
  end
end

# you need to tell RSpec to make it available
# to your specs with the RSpec.configure block.
RSpec.configure do |c|
  c.include AuthorizationHelpers
end
