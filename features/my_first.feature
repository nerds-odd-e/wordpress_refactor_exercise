# encoding: UTF-8
# language: zh-CN

功能: 登录
  作为一个博客的站长
  我希望可以登录到管理后台

  场景: 成功登录
    假如存在用户 "jack" 且他的密码是 "abc123"
    当使用用户名 "jack" 和密码 "abc123" 登录
    那么能够成功登录

  场景: 密码错误登录失败
    假如存在用户 "jack" 且他的密码是 "abc123"
    当使用用户名 "jack" 和密码 "wrong_pass" 登录
    那么会因为密码错误而登录失败

  场景: 没有填写密码登录失败
    假如存在用户 "jack" 且他的密码是 "abc123"
    当使用用户名 "jack" 和密码 "" 登录
    那么会因为没有填写密码而登录失败

  场景: 登录失败
    假如我打开了 URL "http://atdd.local/wp-admin/"
    那么我会看到页面的链接为 "http://atdd.local/wp-login.php?redirect_to=http%3A%2F%2Fatdd.local%2Fwp-admin%2F&reauth=1"
    那么我会看到页面的标题为 "Specification By Example Workshop › Sign In"

    并且我点击了 id 为 "wp-submit" 的按钮
    那么我会看到页面的标题为 "Specification By Example Workshop › Sign In"
    并且我会看到页面的链接为 "http://atdd.local/wp-login.php"

    当我在 id 为 "user_login" 文本框里输入 "odd-e"
    并且我点击了 id 为 "wp-submit" 的按钮
    那么我会看到页面的标题为 "Specification By Example Workshop › Sign In"
    并且我会看到页面的链接为 "http://atdd.local/wp-login.php"
    并且我会看到页面上的文本 "ERROR: The password field is empty."

    当我在 id 为 "user_login" 文本框里输入 "    "
    并且我在 id 为 "user_pass" 文本框里输入 "   "
    并且我点击了 id 为 "wp-submit" 的按钮
    那么我会看到页面的标题为 "Specification By Example Workshop › Sign In"
    并且我会看到页面的链接为 "http://atdd.local/wp-login.php"

    当我在 id 为 "user_login" 文本框里输入 "odd-e"
    并且我在 id 为 "user_pass" 文本框里输入 "bar"
    并且我点击了 id 为 "wp-submit" 的按钮
    那么我会看到页面的标题为 "Specification By Example Workshop › Sign In"
    并且我会看到页面的链接为 "http://atdd.local/wp-login.php"
    并且我会看到页面上的文本 "ERROR: The password you entered for the username odd-e is incorrect."

    当我在 id 为 "user_login" 文本框里输入 "foo"
    并且我在 id 为 "user_pass" 文本框里输入 "bar"
    并且我点击了 id 为 "wp-submit" 的按钮
    那么我会看到页面的标题为 "Specification By Example Workshop › Sign In"
    并且我会看到页面的链接为 "http://atdd.local/wp-login.php"
    并且我会看到页面上的文本 "ERROR: Invalid username."

    当我在 id 为 "user_login" 文本框里输入 "' or '1'='1"
    并且我在 id 为 "user_pass" 文本框里输入 "bar"
    并且我点击了 id 为 "wp-submit" 的按钮
    那么我会看到页面的标题为 "Specification By Example Workshop › Sign In"
    并且我会看到页面的链接为 "http://atdd.local/wp-login.php"
    并且我会看到页面上的文本 "ERROR: Invalid username."

    当我在 id 为 "user_login" 文本框里输入 "<script> %^&*"
    并且我在 id 为 "user_pass" 文本框里输入 "bar"
    并且我点击了 id 为 "wp-submit" 的按钮
    那么我会看到页面的标题为 "Specification By Example Workshop › Sign In"
    并且我会看到页面的链接为 "http://atdd.local/wp-login.php"
    并且我会看到页面上的文本 "ERROR: Invalid username."
