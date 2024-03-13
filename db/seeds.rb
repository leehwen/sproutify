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
Buddy.destroy_all
Message.destroy_all
OfferingOption.destroy_all
Offer.destroy_all
PlantIllness.destroy_all
Offer.destroy_all
Plant.destroy_all
Illness.destroy_all
PlantInfo.destroy_all
Collection.destroy_all
User.destroy_all

puts "creating entries..."

# create users

user1 = User.create!(
  username: "user1",
  email: "user1@email.com",
  password: "password",
  address: "260B Punggol Way, Singapore 822260",
  first_name: "Mary",
  last_name: "Lim",
  token: SecureRandom.alphanumeric(32)
)

user2 = User.create!(
  username: "user2",
  email: "user2@email.com",
  password: "password",
  address: "333D Anchorvale Link, Singapore 544333",
  first_name: "Ashley",
  last_name: "Yeo",
  token: SecureRandom.alphanumeric(32)
)

user3 = User.create!(
  username: "user3",
  email: "user3@email.com",
  password: "password",
  address: "3 Nathan Rd, Singapore 248726",
  first_name: "Nathan",
  last_name: "Yeo",
  token: SecureRandom.alphanumeric(32)
)

user4 = User.create!(
  username: "user4",
  email: "user4@email.com",
  password: "password",
  address: "35 St Thomas Walk, Singapore 238141",
  first_name: "Thomas",
  last_name: "Tan",
  token: SecureRandom.alphanumeric(32)
)

# create plant information

plant_infos1 = PlantInfo.create!(
  name:"Abelmoschus esculentus (L.) Moench",
  common_names: "Lady's Fingers, Okra, Gumbo, Bendi",
  description: "The unripe fruit of Lady’s Finger is a popular vegetable in many cuisines which has a mucilaginous texture.",
  watering: 2,
  propagation: "seed"
)

plant_infos2 = PlantInfo.create!(
  name:"Monstera deliciosa",
  common_names: "Monstera",
  description: "Monstera is a genus of 59 species of flowering plants in the arum family, Araceae, native to tropical regions of the Americas. The genus is named from the Latin word for monstrous or abnormal, and refers to the unusual leaves with natural holes that members of the genus have.",
  watering: 2,
  propagation: "cutting"
)

plant_infos3 = PlantInfo.create!(
  name:"Adenium obesum",
  common_names: "Desert Rose, Sabi star, kudu, mock azalea, impala lily",
  description: "Adenium obesum, more commonly known as a desert rose, is a poisonous species of flowering plant belonging to the tribe Nerieae of the subfamily Apocynoideae of the dogbane family, Apocynaceae.[3] It is native to the Sahel regions south of the Sahara (from Mauritania and Senegal to Sudan), tropical and subtropical eastern and southern Africa and also the Arabian Peninsula.",
  watering: 1,
  propagation: "cutting"
)

plant_infos4 = PlantInfo.create!(
  name:"Abrus precatorius L.",
  common_names: "Rosary pea, Precatory bean, Crab's eyes",
  description: "Abrus precatorius is a slender, perennial climber that twines around trees, shrubs and hedges. The plant is used in some traditional medicine to treat scratches and sores, and wounds. The leaves are used for their anti-suppurative.  In China, the seed were once used to treat fever, malaria, headache, worms and dropsy.",
  watering: 3,
  propagation: "seed"
)

plant_infos5 = PlantInfo.create!(
  name:"Bougainvillea",
  common_names: "Bougainvillea",
  description: "Bougainvillea is a genus of thorny ornamental vines, bushes, and trees belonging to the four o' clock family, Nyctaginaceae. It is native to eastern South America, found from Brazil, west to Peru, and south to southern Argentina. Different authors accept from 4 to 22 species in the genus.[2] The inflorescence consists of large colourful sepal-like bracts which surround three simple waxy flowers, gaining popularity for the plant as an ornamental.",
  watering: 2,
  propagation: "seed"
)

# create plants for each user (user 3 and 4 mainly for marketplace)

Plant.create!(
  nickname: "Lady's Finger",
  remarks: "1 month old seedling",
  user: user1,
  plant_info: plant_infos1,
  watering_frequency: 1,
  start_date: Date.today
)

Plant.create!(
  nickname: "Lady's Finger",
  remarks: "Flowering, ready to have fruits",
  user: user1,
  plant_info: plant_infos1,
  listing: true,
  watering_frequency: 2,
  start_date: Date.today + 2.days
)

Plant.create!(
  nickname: "Big monstera",
  remarks: "Located in the balcony, need lots of water",
  user: user1,
  plant_info: plant_infos2,
  watering_frequency: 7,
  start_date: Date.today + 1.days
)

Plant.create!(
  nickname: "Small monstera",
  remarks: "Just bought from nursery during Chinese New Year",
  user: user1,
  plant_info: plant_infos2,
  watering_frequency: 1,
  start_date: Date.today + 2.days

)

Plant.create!(
  nickname: "Desert Rose",
  remarks: "Hardy plant, need plenty of sunlight",
  user: user1,
  plant_info: plant_infos3,
  watering_frequency: 6,
  start_date: Date.today + 3.days

)

Plant.create!(
  nickname: "Small Desert Rose 1",
  remarks: "Propagated from Desert Rose",
  user: user1,
  plant_info: plant_infos3,
  listing: true,
  watering_frequency: 6,
  start_date: Date.today + 4.days
)

Plant.create!(
  nickname: "Small Desert Rose 2",
  remarks: "Propagated from Desert Rose",
  user: user1,
  plant_info: plant_infos3,
  listing: true,
  watering_frequency: 5,
  start_date: Date.today + 3.days

)

Plant.create!(
  nickname: "Small Desert Rose 3",
  remarks: "Propagated from Desert Rose",
  user: user1,
  plant_info: plant_infos3,
  watering_frequency: 2,
  start_date: Date.today + 3.days

)

Plant.create!(
  nickname: "Monstera light green",
  remarks: "Not too much sun",
  user: user2,
  plant_info: plant_infos2,
  listing: true,
  watering_frequency: 2,
  start_date: Date.today + 2.days
)

Plant.create!(
  nickname: "Desert Rose",
  remarks: "Dont water too much!",
  user: user2,
  plant_info: plant_infos3,
  watering_frequency: 3,
  start_date: Date.today

)

Plant.create!(
  nickname: "Bougainvillea",
  remarks: "Take care, keeps dropping leaves",
  user: user2,
  plant_info: plant_infos5,
  listing: true,
  watering_frequency: 4,
  start_date: Date.today
)

Plant.create!(
  nickname: "Rosary pea",
  remarks: "Climbing on the window frame of my balcony, careful not to close window too tight.",
  user: user2,
  plant_info: plant_infos4,
  watering_frequency: 3,
  start_date: Date.today

)

5.times do
  Plant.create!(
    nickname: Faker::Lorem.word,
    remarks: Faker::Lorem.sentence(word_count: 3),
    user: user3,
    plant_info: [plant_infos1, plant_infos2, plant_infos3, plant_infos4, plant_infos5].sample,
    watering_frequency: 1,
    start_date: Date.today
  )
end

10.times do
  Plant.create!(
    nickname: Faker::Lorem.word,
    remarks: Faker::Lorem.sentence(word_count: 3),
    user: user3,
    plant_info: [plant_infos1, plant_infos2, plant_infos3, plant_infos4, plant_infos5].sample,
    listing: true,
    watering_frequency: 2,
    start_date: Date.today
  )
end

5.times do
  Plant.create!(
    nickname: Faker::Lorem.word,
    remarks: Faker::Lorem.sentence(word_count: 3),
    user: user4,
    plant_info: [plant_infos1, plant_infos2, plant_infos3, plant_infos4, plant_infos5].sample,
    watering_frequency: 3,
    start_date: Date.today
  )
end

10.times do
  Plant.create!(
    nickname: Faker::Lorem.word,
    remarks: Faker::Lorem.sentence(word_count: 3),
    user: user4,
    plant_info: [plant_infos1, plant_infos2, plant_infos3, plant_infos4, plant_infos5].sample,
    listing: true,
    watering_frequency: 4,
    start_date: Date.today
  )
end

# create illnesses

illness_funghi = Illness.create!(
  name: "Funghi Infection",
  cause: "Too much watering and too little fertilizer",
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

illness_browning = Illness.create!(
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

# randomly assign illness to 2 plants of user1 and user2
user1_plants = Plant.where(user: user1).sample(2)
user2_plants = Plant.where(user: user2).sample(2)

PlantIllness.create!(
  illness: illness_funghi,
  plant: user1_plants[0]
)

PlantIllness.create!(
  illness: illness_browning,
  plant: user1_plants[1]
)

PlantIllness.create!(
  illness: illness_funghi,
  plant: user2_plants[0]
)

PlantIllness.create!(
  illness: illness_browning,
  plant: user2_plants[1]
)

# create marketplace offers, 1 for each status type.
# each offer option only 1 for now

user4_lister_plants = Plant.where(listing: true).sample(4)
user3_buyer_plants = Plant.where(listing: true).sample(4)

offer_pending =
  Offer.create!(
    accepted: "pending",
    lister_plant: user4_lister_plants[0],
    buyer_plant: nil,
    lister: user4,
    buyer: user3
  )

OfferingOption.create!(
  offer: offer_pending,
  plant: user3_buyer_plants[0]
)

offer_pending2 =
  Offer.create!(
    accepted: "pending",
    lister_plant: user4_lister_plants[1],
    buyer_plant: nil,
    lister: user4,
    buyer: user3
  )

OfferingOption.create!(
  offer: offer_pending2,
  plant: user3_buyer_plants[1]
)

offer_rejected =
  Offer.create!(
    accepted: "rejected",
    lister_plant: user4_lister_plants[2],
    buyer_plant: nil,
    lister: user4,
    buyer: user3
  )

OfferingOption.create!(
  offer: offer_rejected,
  plant: user3_buyer_plants[2]
)

offer_accepted =
  Offer.create!(
    accepted: "accepted",
    lister_plant: user4_lister_plants[3],
    buyer_plant: user3_buyer_plants[3],
    lister: user4,
    buyer: user3
  )

OfferingOption.create!(
  offer: offer_accepted,
  plant: user3_buyer_plants[3]
)

buddy = Buddy.create!(
  name: "Zi Jie",
  email: "ng_zi_jie@hotmail.com",
  hp: 94373184,
  user: user1,
)

buddy = Buddy.create!(
  name: "Ng Zi Jie",
  email: "ng_zi_jie@hotmail.com",
  hp: 94373184,
  user: user1,
)

buddy = Buddy.create!(
  name: "Ng Zi Jie Clifton",
  email: "ng_zi_jie@hotmail.com",
  hp: 94373184,
  user: user2,
)

puts "seeding entries done!"
