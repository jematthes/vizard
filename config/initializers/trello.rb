require 'trello'

Trello.configure do |config|
  # API key generated by visiting https://trello.com/1/appKey/generate
  config.developer_public_key = 'a7d3756205f0903562b100xxxxxxxxxx'

  # Member token
  # larry-price.com/blog/2014/03/18/connecting-to-the-trello-api/
  config.member_token = '1f27ef47680abb3f90e13c18426c425443a0c9c10234cf12828989xxxxxxxxxx'
end