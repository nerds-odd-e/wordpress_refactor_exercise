@current_time = ""

当(/^普通用户提交了一个评论$/) do
  login "marry", "s3cr3t"
  
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
