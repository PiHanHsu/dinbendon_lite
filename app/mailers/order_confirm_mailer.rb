class OrderConfirmMailer < ApplicationMailer

	def send_orderlist(user)
		@user = user
    mail to:@user.email, subject:"訂購清單明細！"
	end
end
