# encoding: UTF-8
# language: zh-CN

@delete_user
功能: 登录
  作为一个博客的站长
  我希望可以登录到管理后台

  背景: 存在特定的用户
    假如存在用户 "jack" 且他的密码是 "abc123"

  场景: 成功登录
    当使用用户名 "jack" 和密码 "abc123" 登录
    那么能够成功登录

  场景大纲: 登录失败
    当使用用户名 "<username>" 和密码 "<password>" 登录
    那么会因为<错误原因>而登录失败
    例子:
      | username | password | 错误原因 |
      | jack | wrong_pass | 密码错误 |
      | jack | | 没有填写密码 |
      | invalid_user | any_password | 无效的用户名 |
