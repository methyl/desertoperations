task :send_notifies, [:lang] => [:environment] do |t, args|
  Language.find(args[:lang]).users.notified.each do |user|
    UserMailer.notify_email(user).deliver
    puts "Sent to #{user.email}"
  end
end