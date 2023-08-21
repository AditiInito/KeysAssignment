class KeysController < ApplicationController

    before_action :set_key, only: [:keys_called_at, :keys_revived_at, :destroy]

    def create
        Key.create(key: rand(100_000..999_999), called_at: Time.now, revived_at: Time.now)
        redirect_to keys_path
        flash[:notice]="Created a new key"
    end

    def index
        @keys=Key.paginate(page: params[:page], per_page: 15)
    end

    def random
        @keys=Key.where(used: false)
        if @keys.empty?
            render plain: "Keys not found"
            redirect_to keys_path
            flash[:alert]="Key not found"
        else
            @random_key = @keys.random_key
            @random_key.transaction do
              @random_key.update(used: true, called_at: Time.now)
              UnblockKeyJob.delay(run_at: 1.minute.from_now).perform_later(@random_key.id)
            end
            redirect_to keys_path
            flash[:notice]="The key assigned to you is #{@random_key.key}"
        end
    end

    def keys_called_at
        @key.update_key_called_at
        redirect_to keys_path
        flash[:notice]="Unblocked key #{@key.key}"
    end

    def keys_revived_at
        @key.update_key_revived_at
        redirect_to keys_path
        flash[:notice]="Revived key #{@key.key}"
    end

    def destroy
        @key.destroy
        redirect_to keys_path
        flash[:alert]="Key deleted"
    end

    private
    def set_key
        @key = Key.find(params[:id])
    end

end