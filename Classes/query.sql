SELECT agents.first_name, sellers.first_name, sellers.last_name, addresses.state, properties.sold_price 
FROM properties
INNER JOIN agents
  ON properties.agent_id = agents.id
INNER JOIN sellers
  ON properties.seller_id = sellers.id
INNER JOIN addresses
 ON properties.id = addresses.property_id
WHERE properties.status = 'Sold'

