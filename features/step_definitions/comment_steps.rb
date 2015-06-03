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
