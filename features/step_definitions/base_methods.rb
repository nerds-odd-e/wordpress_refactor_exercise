def create_user username, password
  %x[ wp user create "#{username}" "#{username}@chaifeng.com" --role=contributor --user_pass="#{password}" ]
end

def login username, password
  visit "http://atdd.local/wp-login.php"
  fill_in "user_login", with: username
  fill_in "user_pass", with: password
  click_on "Sign In"
end

def logout
  click_on "Log out"
end

def delete_user username
  %x[wp user delete #{username} --yes]
end

def delete_comment post_id, comment_content
  %x[wp comment delete "$(wp comment list --format=ids --post_id=#{post_id} --search="#{comment_content}")" --force]
end
