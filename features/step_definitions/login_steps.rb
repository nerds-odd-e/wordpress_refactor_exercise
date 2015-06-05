# encoding: UTF-8

After('@delete_user') do
  delete_user @username
end

假如(/^存在用户 "(.*?)" 且他的密码是 "(.*?)"$/) do |username, password|
  @username = username
  create_user username, password
end

当(/^使用用户名 "(.*?)" 和密码 "(.*?)" 登录$/) do |username, password|
  login username, password
end

那么(/^能够成功登录$/) do
  expect(title).to eq("Dashboard ‹ Specification By Example Workshop — WordPress")
end

那么(/^会因为(密码错误|没有填写密码|无效的用户名)而登录失败$/) do | error |
  expect(page).to have_content({
    "密码错误" => "ERROR: The password you entered for the username #{@username} is incorrect.",
    "没有填写密码" => "ERROR: The password field is empty.",
    "无效的用户名" => "ERROR: Invalid username."
  }[error])
end
