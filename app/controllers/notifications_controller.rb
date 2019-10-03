# require 'twilio-ruby'

class NotificationsController < ApplicationController
    

    # def send_sms
    #     byebug
    #     # NotificationsController.sms_deets(params[:movies]).send(wait_until: 1.minutes.from_now).perform_later
    # end

    def send_sms
        ##ideally need the user object to hit this controller action
        ##should be hit when notifications = true
        ##would be nice to tell them how many movies are in their "current movies" queue
        ## -> that info is from tomatoes controller/scraping
        byebug
        # sleep(2000)
        ## what causes this controller action to get hit?
        ## ideally would happen on a time interval...once a day?

        movies = params[:movies]
        
        account_sid = ENV["TWILIO_ACCOUNT_SID"]
        auth_token = ENV["TWILIO_AUTH_TOKEN"]

        client = Twilio::REST::Client.new(account_sid, auth_token)

        from = ENV["FROM_NUMBER"]
        to = ENV["TO_NUMBER"]

        message = client.messages.create(
        from: from,
        to: to,
        body: "You have #{movies.length} new movies to check out!"
        )
        
        @results = message
        render :json => @results
        ## results should be accessed in the then statement of the fetch that hits this controller action - we can pass them into whichever function actually makes the map
    end

    def when_to_run
        5.minutes.fom_now
    end

    # handle_asynchronously :send_sms, :run_at => Proc.new { 5.minutes.from_now }
    private

    def notification_params
        params.permit(:movies, :user)
    end
end
