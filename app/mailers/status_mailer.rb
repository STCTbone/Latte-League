class StatusMailer < ActionMailer::Base
  default from: "admin@latteleague.com"

    def notification_email
        @user = params[:user]
        @order = params[:order]
        @comment_text = params[:comment_text]
        mail(to: user.email, subject: "Your order No: #{@order.id}" )
    end
end
