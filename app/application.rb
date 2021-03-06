class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    # item = Item.new(:name,:price)
    @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]
      if req.path.match(/items/)
        item_name = req.path.split("/items/").last

binding.pry
        sought_item = req.params["Figs"]

        if @@items.include?(sought_item.name)
          resp.write "#{sought_item.name}: $#{sought_item.price}"
        else
          resp.write "I'm sorry, we don't carry that item"
          resp.status = 400
        end
      else
        resp.write "Route not found"
        resp.status = 404
      end



    resp.finish

  end

end
