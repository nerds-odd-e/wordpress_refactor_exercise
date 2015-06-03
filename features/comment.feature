# encoding: UTF-8
# language: zh-CN

功能: 评论模块
  作为一个博客的用户
  我希望可以给文章提交评论

  场景: 给文章提交评论
    假如我打开了 URL "http://atdd.local/wp-login.php"
    当我在 id 为 "user_login" 文本框里输入 "tom"
    并且我在 id 为 "user_pass" 文本框里输入 "s3cr3t"
    并且我点击了 id 为 "wp-submit" 的按钮

    当我打开了 URL "http://atdd.local/learning-objectives/"
    并且我在评论文本框里输入 "test123456"
    并且我点击了 "Post Comment"

    那么我会看到评论 "test123456"

    并且我点击了 "Log out"
    当我打开了 URL "http://atdd.local/learning-objectives/"
    那么我不会看到评论 "test123456"
