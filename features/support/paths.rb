module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in list_web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home page$/
      '/'
    when /^the FarmList$/
      '/farms'
    when /^the farms page$/
      '/farms'
    when /^the Create New Farm page$/
      '/farms/new'
    when /^the Create New Pickup page$/
      '/pickup/new'
    when /^the Create New Collection Point page$/
      '/cp/new'
    when /^the login page$/
      new_user_session_path
    when /^the user management page$/
      users_path
    when /^the edit user page for "([^"]*)"$/
      edit_user_path(User.find_by_real_name($1))
    when /^the show user page for "([^"]*)"$/
      user_path(User.find_by_real_name($1))
    when /^the new user page$/
      new_user_path()



    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
