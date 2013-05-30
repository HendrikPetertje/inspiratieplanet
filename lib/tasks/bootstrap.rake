namespace :bootstrap do
      desc "Add the default user"
      task :default_title => :environment do
        Category.create( :title => 'feest')
        Category.create( :title => 'beauty')
        Category.create( :title => 'cadeaus')
        Category.create( :title => 'wonen')
        Category.create( :title => 'relatie familie')
        Category.create( :title => 'mode')
        Category.create( :title => 'erop uit')
        Category.create( :title => 'werk')
      end

      desc "Run all bootstrapping tasks"
      task :all => [:default_title]
    end
