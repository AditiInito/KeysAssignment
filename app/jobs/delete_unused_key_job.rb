class DeleteUnusedKeyJob < ApplicationJob
  queue_as :default

  def perform(key_id)
    key = Key.find(key_id)
    if key && Time.now-key.created_at>=5.minutes
      key.destroy
    end
  end
end
