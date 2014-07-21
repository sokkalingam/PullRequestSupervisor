namespace :setup do

  task :data => :environment do

    repo_urls = ["https://github.paypal.com/api/v3/repos/DemGen-ConsumerApps1/shoppingnodeweb",
                              "https://github.paypal.com/api/v3/repos/DemandGenQA/qaUtils",
                              "https://github.paypal.com/api/v3/repos/DemandGenQA/demandGenE2E",
                              "https://github.paypal.com/api/v3/repos/DemandGenQA/oraTest",
                              "https://github.paypal.com/api/v3/repos/DemandGenQA/pointTest",
                              "https://github.paypal.com/api/v3/repos/DemandGenQA/campaignManagerTest",
                              "https://github.paypal.com/api/v3/repos/DemandGenQA/DGOperability",
                              "https://github.paypal.com/api/v3/repos/Places-R/places",
                              "https://github.paypal.com/api/v3/repos/Moonwalk/smb-white-glove"]

    repo_urls.each do |repo_url|
      Repo.create(:url => repo_url) unless Repo.where(:url => repo_url).exists?
    end

    users = ["koanthony", "kugajjar", "maduraisamy",
              "nikulkarni", "rchettri", "sosubramanian", "vsuryawanshi"]

    users.each do |user|
      User.create(:name => user) unless User.where(:name => user).exists?
    end
    
  end

end