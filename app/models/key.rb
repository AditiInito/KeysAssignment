class Key < ApplicationRecord
    validates :key, uniqueness: true
    scope :random_key, -> { order(Arel.sql("RANDOM()")).first }
    def update_key_called_at
        update(used: false, called_at: Time.now)
    end
    def update_key_revived_at
        update(revived_at: Time.now)
    end
end