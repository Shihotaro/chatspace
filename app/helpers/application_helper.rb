module ApplicationHelper
  def secret_email(email)
    user, _secret = email.split('@')
    "#{user}@XXXXX.XXX"
  end
end
