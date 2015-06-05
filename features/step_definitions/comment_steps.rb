当(/^普通用户提交了一个评论$/) do
  login "marry", "s3cr3t"

  @post_id = 9
  @comment_content = "a comment by subscriber"

  visit "http://atdd.local/?p=#{@post_id}"
  fill_in "comment", with: @comment_content
  click_on "Post Comment"
end

那么(/^这个评论将等待被审核$/) do
  comment_ids = %x[wp comment list --format=ids --post_id=#{@post_id} --status=hold --search="#{@comment_content}"]
  expect(comment_ids).not_to eq("")
end

那么(/^这个评论不会被其他人公开看到$/) do
  logout
  expect(page).to have_no_content("a comment by subscriber")
  delete_comment @post_id, @comment_content
end

当(/^这个评论被编辑审核通过$/) do
  %x[wp comment approve "$(wp comment list --format=ids --post_id=#{@post_id} --status=hold --search="#{@comment_content}")"]
end

那么(/^这个评论将被其他人公开看到$/) do
  logout
  visit "http://atdd.local/?p=9"
  expect(page).to have_content("a comment by subscriber")
  delete_comment @post_id, @comment_content
end
