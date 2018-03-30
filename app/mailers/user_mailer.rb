class UserMailer < ApplicationMailer
    default from: "jacob.yun429@gmail.com"

    def new_user(user)
        @user = user
        mail(to: user.email, subject: "Welcome to Jiki")
    end
end
