# encoding: UTF-8

假如(/^存在用户 "(.*?)" 且他的密码是 "(.*?)"$/) do |arg1, arg2|
  @username = arg1
  %x[ wp user create "#{arg1}" "#{arg1}@chaifeng.com" --role=contributor --user_pass="#{arg2}" ]
end

当(/^使用用户名 "(.*?)" 和密码 "(.*?)" 登录$/) do |arg1, arg2|
  visit "http://atdd.local/wp-admin/"
  fill_in "user_login", with: arg1
  fill_in "user_pass", with: arg2
  click_on "Sign In"
end

那么(/^能够成功登录$/) do
  expect(title).to eq("Dashboard ‹ Specification By Example Workshop — WordPress")
  %x[wp user delete #{@username} --yes]
end
