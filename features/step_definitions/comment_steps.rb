@current_time = ""

当(/^我在评论文本框里输入 "(.*?)"$/) do |arg1|
  @current_time = Time.now.to_s
  step %Q[我在 id 为 "comment" 文本框里输入 "#{arg1}|#{@current_time}"]
end

那么(/^我会看到评论 "(.*?)"$/) do |arg1|
  step %Q[我会看到页面上的文本 "#{arg1}|#{@current_time}"]
end

那么(/^我不会看到评论 "(.*?)"$/) do |arg1|
  expect(page).to have_no_content("#{arg1}|#{@current_time}")
end

假如(/^批准了评论 "(.*?)"$/) do |arg1|
  %x[wp comment approve $(wp comment list --format=ids --search="#{arg1}|#{@current_time}")]
end

当(/^普通用户提交了一个评论$/) do
  visit "http://atdd.local/wp-login.php"
  fill_in "user_login", with: "marry"
  fill_in "user_pass", with: "s3cr3t"
  click_on "Sign In"

  visit "http://atdd.local/?p=9"
  fill_in "comment", with:"a comment by subscriber"
  click_on "Post Comment"
end

那么(/^这个评论将等待被审核$/) do
  comment_ids = %x[wp comment list --format=ids --post_id=9 --status=hold --search="a comment by subscriber"]
  expect(comment_ids).not_to eq("")
end

那么(/^这个评论不会被其他人公开看到$/) do
  click_on "Log out"
  expect(page).to have_no_content("a comment by subscriber")
  %x[wp comment delete "$(wp comment list --format=ids --post_id=9 --status=hold --search="a comment by subscriber")" --force]
end

当(/^这个评论被编辑审核通过$/) do
  %x[wp comment approve "$(wp comment list --format=ids --post_id=9 --status=hold --search="a comment by subscriber")"]
end

那么(/^这个评论将被其他人公开看到$/) do
  click_on "Log out"
  visit "http://atdd.local/?p=9"
  expect(page).to have_content("a comment by subscriber")
  %x[wp comment delete "$(wp comment list --format=ids --post_id=9 --search="a comment by subscriber")" --force]
end
