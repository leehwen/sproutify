# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "resetting data base..."

PlantIllness.destroy_all
PlantInfo.destroy_all
Plant.destroy_all
Illness.destroy_all
User.destroy_all

puts "creating entries..."

user1 = User.create!(
  username: "user1",
  email: "user1@email.com",
  password: "password",
  address: "Punggoll",
  first_name: "user1",
  last_name: "ng1"
)

user2 = User.create!(
  username: "user2",
  email: "user2@email.com",
  password: "password",
  address: "Sengkang",
  first_name: "user2",
  last_name: "ng2"
)

plant_infos1 = PlantInfo.create!(
  name:"Leucojum vernum",
  common_names: "Spring Snowflake",
  description: "Leucojum vernum, called the spring snowflake, is a species of flowering plant in the family Amaryllidaceae.
    It is native to central and southern Europe from Belgium to Ukraine. It is considered naturalized in north-western Europe,
    including Great Britain and parts of Scandinavia, and in the US states of Georgia and Florida. This spring flowering bulbous
    herbaceous perennial is cultivated as an ornamental for a sunny position. The plant multiplies in favourable conditions to form clumps.
    Each plant bears a single white flower with greenish marks near the tip of the tepal, on a stem about 10–20 cm (3.9–7.9 in) tall,
    occasionally more. The Latin specific epithet vernum means relating to Spring. Its close relative, Leucojum aestivum, flowers in
    summer.",
  watering: 1,
  propagation: "cutting"
)

plant_infos2 = PlantInfo.create!(
  name:"Monstera",
  common_names: "Monster of a plant",
  description: "Leucojum vernum, called the spring snowflake, is a species of flowering plant in the family Amaryllidaceae.
  It is native to central and southern Europe from Belgium to Ukraine. It is considered naturalized in north-western Europe,
  including Great Britain and parts of Scandinavia, and in the US states of Georgia and Florida. This spring flowering bulbous
  herbaceous perennial is cultivated as an ornamental for a sunny position. The plant multiplies in favourable conditions to form clumps.
  Each plant bears a single white flower with greenish marks near the tip of the tepal, on a stem about 10–20 cm (3.9–7.9 in) tall,
  occasionally more. The Latin specific epithet vernum means relating to Spring. Its close relative, Leucojum aestivum, flowers in
  summer.",
  watering: 2,
  propagation: "water"
)

Plant.create!(
  nickname: "Lovely Plant",
  remarks: "This is my most loved plant of all!",
  user: user1,
  plant_info: plant_infos1,

)

Plant.create!(
  nickname: "Very needy plant..",
  remarks: "Super annoying... need to keep watering..",
  user: user2,
  plant_info: plant_infos2

)

Illness.create!(
  name: "finished flowering period",
  cause: "fungi infection",
  description: "Fungi take energy from the plants on which they live, causing damage to the plant.
  Fungal infections are responsible for approximately two-thirds of infectious plant diseases and
  cause wilting, molding, rusts, scabs, rotted tissue, and other problems.",
  treatment: {
    "chemical": [
        "If necessary, apply a fungicide. If you don' know the fungus species, choose fungicide based on the infected plant (e.g. house plant, garden plant, tree)."
    ],
    "biological": [
        "If possible remove and destroy the infected parts of the plant. Burn it, toss it into the garbage, or bury it deeply. Do not compost.",
        "Apply ecological products for plant protection (e.g. neem oil, baking soda, soap)."
    ],
    "prevention": [
        "Use resistant species and cultivars as well as healthy, certified seeds and seedlings.",
        "Ensure having good soil drainage to avoid overwatering.",
        "Improve the air circulation around the plant (e.g. by pruning excess foliage or increasing the spacing between plants).",
        "Avoid prolonged wetting of the leaves, which can be caused e.g. by overhead irrigation.",
        "Rotate crops. Avoid planting sensitive crops in infested soil.",
        "Disinfect tools, infected flower pots, and hands to avoid disease transmission."
    ]},
  common_names: "butterfly bacteria"
)

Illness.create!(
  name: "Browning",
  cause: "Insufficient water",
  description: "Insufficient water can cause a deteorioriation of growth. Browning will eventually cause the plant to wilt ",
  treatment: {
    "chemical": [
        "If necessary, apply a fungicide. If you don' know the fungus species, choose fungicide based on the infected plant (e.g. house plant, garden plant, tree)."
    ],
    "biological": [
        "If possible remove and destroy the infected parts of the plant. Burn it, toss it into the garbage, or bury it deeply. Do not compost.",
        "Apply ecological products for plant protection (e.g. neem oil, baking soda, soap)."
    ],
    "prevention": [
        "Use resistant species and cultivars as well as healthy, certified seeds and seedlings.",
        "Ensure having good soil drainage to avoid overwatering.",
        "Improve the air circulation around the plant (e.g. by pruning excess foliage or increasing the spacing between plants).",
        "Avoid prolonged wetting of the leaves, which can be caused e.g. by overhead irrigation.",
        "Rotate crops. Avoid planting sensitive crops in infested soil.",
        "Disinfect tools, infected flower pots, and hands to avoid disease transmission."
    ]},
  common_names: "Lack of water"
)

puts "seeding entries done!"
