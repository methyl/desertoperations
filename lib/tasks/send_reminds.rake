task :send_reminds => :environment do
  Remind.all.each do |remind|
    UserMailer.remind_email(remind).deliver if remind.player.available?
    remind.destroy
  end
end