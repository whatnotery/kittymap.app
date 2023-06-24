class NewCatMailer < ApplicationMailer

    def new_cat_email(cat)
        @cat = cat
        User.all.each do |user|
            unless user == @cat.user
                mail(to: user.email, subject: "New cat added on KittyMap.app")
            end
        end
    end
end
