Fabricator(:interface) do
  user
  ip Faker::Internet.ip_v4_address
  ddns Faker::Internet.domain_name
  port Faker::Number.number(4)
  last_responded_at Time.current
  # scope ['public', 'private', ''].sample
end