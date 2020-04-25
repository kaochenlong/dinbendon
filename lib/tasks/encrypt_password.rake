namespace :db do
  desc 'encrypt_old_password'
  task :encrypt_password => :environment do
    puts "ready for encrypt password!"
    User.where.not(created_at: Time.now).find_each do |user|
      user.update(password: Digest::SHA256.hexdigest(User::SALTF + user.password + User::SALTE))
    end
    puts "finished!"
  end
end