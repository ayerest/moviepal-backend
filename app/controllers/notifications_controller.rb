require 'twilio-ruby'

class NotificationsController < ApplicationController
    def send_sms
        byebug
        ## what causes this controller action to get hit?
        ## ideally would happen on a time interval...once a day?
        account_sid = ENV["TWILIO_ACCOUNT_SID"]
        auth_token = ENV["TWILIO_AUTH_TOKEN"]

        client = Twilio::REST::Client.new(account_sid, auth_token)

        from = '+' # Your Twilio number
        to = '+' # Your mobile phone number

        client.messages.create(
        from: from,
        to: to,
        body: "You have #{numMovies} new movies to check out!"
        )
        
        @results = {}
        render :json => @results
        ## results should be accessed in the then statement of the fetch that hits this controller action - we can pass them into whichever function actually makes the map
    end
end
