module ApplicationHelper
    def format_time_in_kolkata(time)
        time.in_time_zone('Asia/Kolkata').strftime('%Y-%m-%d %H:%M:%S')
    end
end
