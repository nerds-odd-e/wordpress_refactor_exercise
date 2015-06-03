# encoding: UTF-8
# language: zh-CN

功能: 登录
  作为一个博客的站长
  我希望可以登录到管理后台

  场景: 成功登录
    假如我打开了 URL "http://atdd.local/wp-admin/"
    那么我会看到页面的链接为 "http://atdd.local/wp-login.php?redirect_to=http%3A%2F%2Fatdd.local%2Fwp-admin%2F&reauth=1"
    那么我会看到页面的标题为 "Specification By Example Workshop › Sign In"
    当我在 id 为 "user_login" 文本框里输入 "odd-e"
    并且我在 id 为 "user_pass" 文本框里输入 "s3cr3t"
    并且我点击了 id 为 "wp-submit" 的按钮
    那么我会看到页面的标题为 "Dashboard ‹ Specification By Example Workshop — WordPress"
    并且我会看到页面的链接为 "http://atdd.local/wp-admin/"

  场景: 登录失败
    假如我打开了 URL "http://atdd.local/wp-admin/"
    那么我会看到页面的链接为 "http://atdd.local/wp-login.php?redirect_to=http%3A%2F%2Fatdd.local%2Fwp-admin%2F&reauth=1"
    那么我会看到页面的标题为 "Specification By Example Workshop › Sign In"
    当我在 id 为 "user_login" 文本框里输入 "foo"
    并且我在 id 为 "user_pass" 文本框里输入 "bar"
    并且我点击了 id 为 "wp-submit" 的按钮
    那么我会看到页面的标题为 "Specification By Example Workshop › Sign In"
    并且我会看到页面的链接为 "http://atdd.local/wp-login.php"
    并且我会看到页面上的文本 "ERROR: Invalid username."
