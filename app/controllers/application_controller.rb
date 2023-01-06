class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # Add routes
  get '/foods' do 
    foods = Food.all 
    foods.to_json
  end

  get '/reviews' do 
    reviews = Review.all 
    reviews.to_json
  end

  post '/reviews'do
   reviews = Review.create(
    name: params[:name],
    description: params[:description],
    rating: params[:rating]
   )
   reviews.to_json
  end

  patch '/reviews/:id' do
    review = Review.find(params[:id])
    review.update( body: params[:body] )
    review.to_json
  end

  
  delete '/reviews/:id' do 
    review = Review.find(params[:id])
    review.destroy
    review.to_json
  end
end
