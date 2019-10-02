# require 'twilio-ruby'

class NotificationsController < ApplicationController
    # include DelayedAction

    # delayed_action [:sms_deets]
    def send_sms 
        NotificationsController.sms_deets.set(wait_until: 5.minutes.from_now).perform_later
    end
    def self.sms_deets
        ##ideally need the user object to hit this controller action
        ##should be hit when notifications = true
        ##would be nice to tell them how many movies are in their "current movies" queue
        ## -> that info is from tomatoes controller/scraping
        byebug
        ## what causes this controller action to get hit?
        ## ideally would happen on a time interval...once a day?
        account_sid = ENV["TWILIO_ACCOUNT_SID"]
        auth_token = ENV["TWILIO_AUTH_TOKEN"]

        client = Twilio::REST::Client.new(account_sid, auth_token)

        from = ENV["FROM_NUMBER"]
        to = ENV["TO_NUMBER"]

        client.messages.create(
        from: from,
        to: to,
        body: "You have #{numMovies} new movies to check out!"
        )
        
        @results = {}
        render :json => @results
        ## results should be accessed in the then statement of the fetch that hits this controller action - we can pass them into whichever function actually makes the map
    end

    # def when_to_run
    #     5.minutes.fom_now
    # end

    # handle_asynchronously :send_sms, :run_at => Proc.new { 5.minutes.from_now }
end
