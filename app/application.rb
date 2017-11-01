class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      requested_item = req.path.split("/").last
      if item_price = @@items.find{|n| n.name = requested_item}
        resp.write item_price.price
      else
        resp.write "Item not found"
        resp.status = 400


      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
