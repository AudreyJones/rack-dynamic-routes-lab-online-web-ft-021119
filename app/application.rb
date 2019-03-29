class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]

      if req.path.match(/items/)
        item_name = req.path.split("/items/").last
        binding.pry
        @@items.each do {|item|
        #
        #
        #
        #   if item.name = item_name
        #     resp.write "#{item.name}: $#{item.price}"
        #   #  item.name !=
        #   end
        #   }


      else
        resp.write "Route not found"
        resp.status = 404
      end



    resp.finish

  end

end
