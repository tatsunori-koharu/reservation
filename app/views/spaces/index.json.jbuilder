json.array! @spaces, partial: "spaces/space", as: :space
json.url order_url(order, format: :json)
