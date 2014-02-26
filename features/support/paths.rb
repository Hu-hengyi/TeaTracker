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
    when /^the routes page$/
      '/routes'
    when /^the payments page$/
      '/payments'
    when /^the collection points page$/
      '/cps'
    when /^the Create New Farm page$/
      '/farms/new'
    when /^the deposits page/
      deposits_path
    when /^the Tea Deposit page$/
      '/deposits'
    when /^the Create New Tea Deposit page$/
      '/deposits/new'
    when /^the Pay Group page$/
      '/pay_groups'
    when /^the Create New Pay Group page$/
      '/pay_groups/new'
    when /^the Create New Collection Point page$/
      '/cps/new'
    when /^the login page$/
      new_user_session_path
    when /^the user management page$/
      users_path
    when /^the edit user page for "([^"]*)"$/
      edit_user_path(User.find_by_name($1))
    when /^the show user page for "([^"]*)"$/
      user_path(User.find_by_name($1))
    when /^the new user page$/
      new_user_path()
    when /^the request confirmation page$/
      "/users/confirmation"
    when /^the confirmation email link for "([^"]*)"$/
      user = User.find_by_email($1)
      confirmation_token = user.confirmation_token
      "/users/confirmation?confirmation_token=#{confirmation_token}"



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
