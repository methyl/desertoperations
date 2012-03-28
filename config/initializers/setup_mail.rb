ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :user_name            => "nocuje.net",  
  :password             => "niepowiem",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}