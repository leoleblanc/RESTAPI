json.array! @users do |user|
  json.id user.id
  json.name user.name
  json.technical user.technical
  json.tagline user.tagline
end