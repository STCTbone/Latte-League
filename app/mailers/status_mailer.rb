class StatusMailer < ActionMailer::Base
  default from: "matthew.rieger@gmail.com"

    def notification_email
        @user = params[:user]
        @order = params[:order]
        @comment_text = params[:comment_text]
        mail(to: user.email, subject: "Your order No: #{@order.id}" )
    end

    def order_email(user_id, order_id)
        @user = user.find_by_id(user_id)
        @order = order.find_by_id(order_id)
        mail(to: 'riegerlegal@me.com', subject: "New Order from #{@user.first_name} #{@user.last_name}")
    end

    def status_email(user_id, order_id)
        @user = User.find_by_id(user_id)
        @order = Order.find_by_id(order_id)
        mail(to: @user.email, subject: "Your order is #{@order.status}!")
    end
end
