class OrderConfirmMailer < ApplicationMailer

	def send_orderlist(user, order)
		@user = user
		@order = order
		@orderlists = order.orderlists
    mail to:@user.email, subject:"訂購清單明細！"
	end
end
