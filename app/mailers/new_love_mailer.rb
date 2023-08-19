class NewLoveMailer < ApplicationMailer

    def new_love_email(user, cat, cat_lover)
        @user = user
        @cat = cat
        @cat_lover = cat_lover
        mail(to: @user.email, subject: "Someone loved a cat you spotted on KittyMap.app")
    end
end
