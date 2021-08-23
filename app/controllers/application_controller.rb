class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'
  # add routes

  get "/bakeries" do
    bakeries = Bakery.all
    bakeries.to_json(include: :baked_goods)
  end

  get "/bakeries/:id" do
    bakeries = Bakery.all.find(params[:id])
    bakeries.to_json(include: :baked_goods)
  end

  get "/baked_goods" do
    goods = BakedGood.all
    goods.to_json
  end

  get "/baked_goods/by_price" do
    goods = BakedGood.all.order(price: :desc)
    goods.to_json
  end

  get "/baked_goods/most_expensive"do 
    goods = BakedGood.all.order(:price).limit(1)
    goods.to_json
  end

end
