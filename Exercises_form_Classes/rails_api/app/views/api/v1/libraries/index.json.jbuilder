json.libraries @libraries do |library|
  json.(library, :id, :name, :date_built)
  json.address do 
    json.street library.address.street
    json.city library.address.city
    json.state library.address.state
    json.zip library.address.zip
  end
  json.url api_v1_library_url(library)
end