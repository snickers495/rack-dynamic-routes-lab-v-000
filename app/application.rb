class Application


  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if @@item.include?(item_name)
        item_price = @@item.find{|item| item.name = item_name}
        resp.write item_price.price
      else
        resp.write "Item not found"
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
