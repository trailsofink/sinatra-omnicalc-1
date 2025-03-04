require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get('/square/new') do
  
  erb(:square)
end  

get('/square/results') do
  @num = params.fetch('number').to_i
  @result = @num.to_f**2
  erb(:square_results)
end

get('/square_root/new') do
  erb(:square_root)
end

get('/square_root/results') do 
  @num = params.fetch('user_number').to_i
  @result = Math.sqrt(@num.to_f)
  erb(:square_root_results)
end

get('/payment/new') do
  erb(:payment)
end

get('/payment/results') do
  @apr = params.fetch('user_apr').to_f
  @num_of_years = params.fetch('user_years').to_i
  @principal = params.fetch('user_pv').to_f

  # Convert APR
  @monthly_rate = (@apr / 100) / 12

  # Convert Years to Months
  @num_of_months = @num_of_years * 12

  # Convert the Numerator and Denominator
  @numerator = @monthly_rate * (@principal * ((1 + @monthly_rate)**@num_of_months))
  @denominator = ((1 + @monthly_rate)**@num_of_months) - 1

  # Calculate the equation
  @payment = @numerator / @denominator
  
  erb(:payment_results)
end
 
get('/random/new') do
  erb(:random)
end

get('/random/results') do
  @user_min = params.fetch('user_min').to_f
  @user_max = params.fetch('user_max').to_f
  @result = rand(@user_min..@user_max).to_f
  erb(:random_results)
end
