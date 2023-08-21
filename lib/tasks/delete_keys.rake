namespace :keys do
    desc "Delete unused keys"
    task :update => :environment do
        # Key.find_each do |key|
        #     id=key.id
        #     if Time.now-key.created_at>=5.minutes
        #         key.destroy
        #         puts "deleted key with id #{id}"
        #     end
        # end
        @unused_keys=Key.where('revived_at <= ?', 5.minutes.ago).destroy_all
    end
end
