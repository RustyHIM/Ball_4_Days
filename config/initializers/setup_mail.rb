ActionMailer::Base.smtp_settings = {
:address		=> "smtp.gmail.com",
:port			=> 587,
:domain			=> "ball4days.com",
:user_name		=> "ball4days.com",
:password		=> "secret",
:authentication => "plain",
:enable_starttls_auto => true
}