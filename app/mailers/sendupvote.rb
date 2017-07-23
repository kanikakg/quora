class Sendupvote < ApplicationMailer
	 # default from: 'notifications@example.com'
 
	 #  def welcome_email(user)
	 #    @user = user
	 #    @url  = 'http://example.com/login'
	 #    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
	 #  end

def sample_email(user)
    @email= user.email
    mail(to: @email, subject: 'Sample Email')
  end
end
