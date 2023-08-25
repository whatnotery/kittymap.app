class NewCommentMailer < ApplicationMailer
  def new_comment_email(user, cat)
    @user = user
    @cat = cat
    mail(to: @user.email, subject: "A comment was added to a cat you spotted on KittyMap.app")
  end
end
