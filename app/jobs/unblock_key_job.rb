class UnblockKeyJob < ApplicationJob
  queue_as :default

  def perform(key_id)
    key = Key.find(key_id)
    if key && (Time.now-key.called_at>=1.minute)
      key.update(used: false, updated_at: DateTime.now)
    end
  end
end
