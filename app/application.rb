class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/").last
      item_price = @@items.find{|n| n.name = item_name}
      if item_price.nil?
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write "#{item_price.price}"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
