require 'sinatra'
require 'sinatra/reloader'

@@random_number = rand(100)
@@guess_count = 5

get '/' do
  guess = params['guess']
  if guess != ''
    message = check_guess(guess)
    @@guess_count -= 1
    message += "<br>#{@@guess_count} guesses remaining."
  else
    message = 'Make a guess!'
  end

  if @@random_number == guess.to_i || @@guess_count == 0
    @@random_number = rand(100)
    @@guess_count = 5
    message += '<br>New random number generated with 5 tries to guess'
  end

  locals = {:random_number => @@random_number, :message => message, :guess_count => @@guess_count}

  erb :index, :locals => locals

end

def check_guess(guess)
  guess = guess.to_i
  if guess > @@random_number + 5
    "Way too high!"
  elsif guess > @@random_number
    "Too high"
  elsif guess == @@random_number
    "You got it!<br>The SECRET NUMBER is #{@@random_number}<br>"
  elsif guess < @@random_number - 5
    "Way too low!"
  elsif guess < @@random_number
    "Too low"
  else
    "Something went wrong"
  end
end