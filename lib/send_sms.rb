# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
require_relative 'takeaway'
account_sid = 'ACfab42b5c1a3a5d02de438e8a7d66d089'
auth_token = 'd376d054b58c5ed7c9704e307bb3f883'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+441782435553' # Your Twilio number
to = '+447914699003' # Your mobile phone number


client.messages.create(
from: from,
to: to,
body: "Hello Customer, here is your order: "
)
