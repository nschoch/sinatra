require 'sinatra'
require 'sinatra/reloader'

RANDOM_NUMBER = rand(100)

get '/' do
  guess = params['guess']
  message = check_guess(guess)
  
  erb :index, :locals => {:random_number => RANDOM_NUMBER, :message => message}
end

def check_guess(guess)
  guess = guess.to_i
  if guess == 0
    ''
  elsif guess > RANDOM_NUMBER + 5
    "Way too high!"
  elsif guess > RANDOM_NUMBER
    "Too high"
  elsif guess == RANDOM_NUMBER
    "You got it!<br>The SECRET NUMBER is #{RANDOM_NUMBER}<br>"
  elsif guess < RANDOM_NUMBER - 5
    "Way too low!"
  elsif guess < RANDOM_NUMBER
    "Too low"
  else
    "Something went wrong"
  end
end