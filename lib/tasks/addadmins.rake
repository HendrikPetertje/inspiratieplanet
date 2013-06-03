namespace :addadmins do
      desc "add admin users to database"
      task :addadminsaction => :environment do
         u = User.new
         u.email = "admin@inspiratieplanet.nl"
         u.name = "Peter van der Meulen"
         u.password = "admin123"
         u.admin = "true"
         u.save
        
      end

      desc "Run all admin tasks"
      task :all => [:addadminsaction]
    end
