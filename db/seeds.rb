# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

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
  username: "leehwen",
  email: "user1@email.com",
  password: "password",
  address: "260B Punggol Way, Singapore 822260",
  first_name: "Melvin",
  last_name: "Lee",
  token: SecureRandom.alphanumeric(32)
)

file = URI.open("https://thispersondoesnotexist.com/")
user1.image.attach(io: file, filename: "avatar1.jpeg", content_type: "image/jpeg")
user1.save

user2 = User.create!(
  username: "yytan",
  email: "user2@email.com",
  password: "password",
  address: "333D Anchorvale Link, Singapore 544333",
  first_name: "Yin Yun",
  last_name: "T.",
  token: SecureRandom.alphanumeric(32)
)

file = URI.open("https://thispersondoesnotexist.com/")
user2.image.attach(io: file, filename: "avatar2.jpeg", content_type: "image/jpeg")
user2.save

user3 = User.create!(
  username: "zijie",
  email: "user3@email.com",
  password: "password",
  address: "3 Nathan Rd, Singapore 248726",
  first_name: "Zi Jie",
  last_name: "Ng",
  token: SecureRandom.alphanumeric(32)
)

file = URI.open("https://thispersondoesnotexist.com/")
user3.image.attach(io: file, filename: "avatar3.jpeg", content_type: "image/jpeg")
user3.save

user4 = User.create!(
  username: "mirana",
  email: "user4@email.com",
  password: "password",
  address: "35 St Thomas Walk, Singapore 238141",
  first_name: "Tuck Seng",
  last_name: "Wong",
  token: SecureRandom.alphanumeric(32)
)

file = URI.open("https://thispersondoesnotexist.com/")
user4.image.attach(io: file, filename: "avatar4.jpeg", content_type: "image/jpeg")
user4.save

user5 = User.create!(
  username: "fengyong",
  email: "user5@email.com",
  password: "password",
  address: "718 Woodlands Ave 6, Singapore 730718",
  first_name: "Yong",
  last_name: "Feng",
  token: SecureRandom.alphanumeric(32)
)

file = URI.open("https://thispersondoesnotexist.com/")
user5.image.attach(io: file, filename: "avatar5.jpeg", content_type: "image/jpeg")
user5.save

# create plant information

plant_infos1 = PlantInfo.create!(
  name:"Abelmoschus esculentus (L.) Moench",
  common_names: "Lady's Fingers, Okra, Gumbo, Bendi",
  description: "The unripe fruit of Lady’s Finger is a popular vegetable in many cuisines which has a mucilaginous texture.",
  watering: 2,
  propagation: "[\"seeds\"]",
  image_url: "https://media.karousell.com/media/photos/products/2024/2/3/okra_seeds_ladys_finger_star_o_1706930552_1f466e12_thumbnail.jpg"
)

plant_infos2 = PlantInfo.create!(
  name:"Monstera deliciosa",
  common_names: "Monstera",
  description: "Monstera is a genus of 59 species of flowering plants in the arum family, Araceae, native to tropical regions of the Americas. The genus is named from the Latin word for monstrous or abnormal, and refers to the unusual leaves with natural holes that members of the genus have.",
  watering: 2,
  propagation: "[\"cuttings\", \"seeds\"]",
  image_url: "https://media.karousell.com/media/photos/products/2024/1/25/monstera_swiss_cheese_plant_1706155704_5b335d06_progressive.jpg"
)

plant_infos3 = PlantInfo.create!(
  name:"Adenium obesum",
  common_names: "Desert Rose, Sabi star, kudu, mock azalea, impala lily",
  description: "Adenium obesum, more commonly known as a desert rose, is a poisonous species of flowering plant belonging to the tribe Nerieae of the subfamily Apocynoideae of the dogbane family, Apocynaceae.[3] It is native to the Sahel regions south of the Sahara (from Mauritania and Senegal to Sudan), tropical and subtropical eastern and southern Africa and also the Arabian Peninsula.",
  watering: 1,
  propagation: "[\"cuttings\"]",
  image_url: "https://media.karousell.com/media/photos/products/2018/07/29/adenium__desert_rose_plant_1532860670_66dda519.jpg"
)

plant_infos4 = PlantInfo.create!(
  name:"Abrus precatorius L.",
  common_names: "Rosary pea, Precatory bean, Crab's eyes",
  description: "Abrus precatorius is a slender, perennial climber that twines around trees, shrubs and hedges. The plant is used in some traditional medicine to treat scratches and sores, and wounds. The leaves are used for their anti-suppurative.  In China, the seed were once used to treat fever, malaria, headache, worms and dropsy.",
  watering: 3,
  propagation: "[\"cuttings\", \"seeds\"]",
  image_url: "https://www.nparks.gov.sg/-/media/ffw/migrated/round2/flora/3480/13dcf402da8f44109adf2742f3d81a3c.ashx"
)

plant_infos5 = PlantInfo.create!(
  name:"Bougainvillea",
  common_names: "Bougainvillea",
  description: "Bougainvillea is a genus of thorny ornamental vines, bushes, and trees belonging to the four o' clock family, Nyctaginaceae. It is native to eastern South America, found from Brazil, west to Peru, and south to southern Argentina. Different authors accept from 4 to 22 species in the genus.[2] The inflorescence consists of large colourful sepal-like bracts which surround three simple waxy flowers, gaining popularity for the plant as an ornamental.",
  watering: 2,
  propagation: "[\"seeds\"]",
  image_url: "https://www.teojooguan.com/wp-content/uploads/2020/06/Bougainvillea-Red-Mixed-768x1024.jpg"
)

plant_infos6 = PlantInfo.create!(
  name:"Asplenium nidus L. var. nidus",
  common_names: "Bird's Nest Fern, Rumah Langsuyar",
  description: "The bird's-nest fern (Asplenium nidus) is a large, leafy fern commonly found on wayside trees in Singapore, particularly the rain tree.",
  watering: 2,
  propagation: "[\"spores\"]",
  image_url: "https://www.nparks.gov.sg/-/media/ffw/protected/flora/1/5/1541/asplenium-nidus_low-wei-teng.ashx"
)

plant_infos7 = PlantInfo.create!(
  name:"Epipremnum aureum (Linden & André) G.S. Bunting",
  common_names: "Golden Pothos, Money Plant, Devil's Ivy",
  description: "It is a climber to creeper with stems that can grow up to 12 m long. The leaves usually have yellow-marble pattern. Young plants have waxy, heart-shaped green leaves, measuring up to 10 cm long and variegated with yellow to white.",
  watering: 2,
  propagation: "[\"stem cutting\"]",
  image_url: "https://media.karousell.com/media/photos/products/2023/7/26/money_plant_1690347279_f65dfbeb_progressive.jpg"
)

plant_infos8 = PlantInfo.create!(
  name:"Papilionanthe Miss Joaquim",
  common_names: "Vanda Miss Joaquim",
  description: "This slow-growing hybrid grows best in an open, sunny location with humid, non-stagnant air. It requires heavy fertilisation for optimal flowering. The slender stems should be tied to posts for support.",
  watering: 2,
  propagation: "[\"stem cutting\"]",
  image_url: "https://media.karousell.com/media/photos/products/2022/4/20/vanda_miss_joaquim_atherton_or_1650443332_b7fe9d46_progressive.jpg"
)

plant_infos9 = PlantInfo.create!(
  name:"Anthurium andraeanum Linden ex André",
  common_names: "Anthurium, Flamingo Lily, Painter's Palette",
  description: "It is an small, upright herbaceous plant that grows to 40 cm in height. Adventitious roots may occur in some plants. Its flowers are axillary, produced on a spadix inflorescence. The inflorescence comprise of a cream-yellow tail-like spadix and bright red spathe that is wide, flat and waxy. The long lasting flowers can bloom multiple times yearly when optimum conditions are met.",
  watering: 1,
  propagation: "[\"seeds\"]",
  image_url: "https://media.karousell.com/media/photos/products/2024/2/13/anthurium_red_potted_plant_1707802649_02ad88c2_progressive.jpg"
)

plant_infos10 = PlantInfo.create!(
  name:"Impatiens balsamina L.",
  common_names: "Garden Balsam, Rose Balsam",
  description: "Garden Balsam is a annual herb that reaches to 1 m in height. Garden Balsam have elliptic to lance-shaped leaves with serrated margins and showy flowers that come in many colours; pink, red, purple. The genus, Impatiens is the latin word for impatient, referring to the explosive release of seeds from the fruit pod. They are easy to grow, tolerant of short periods of drought and with proper light, fertile well drained soil, the Garden Balsam thrives well in any gardens.",
  watering: 1,
  propagation: "[\"seeds\"]",
  image_url: "https://media.karousell.com/media/photos/products/2017/08/01/assorted_balsam_plant_seeds_1501567501_31e894a9.jpg"
)

# create plants for each user (user 3 and 4 mainly for marketplace)

Plant.create!(
  nickname: "Baby Lady's Finger",
  remarks: "1 month old seedling",
  user: user1,
  plant_info: plant_infos1,
  watering_frequency: 1,
  start_date: Date.today
)

Plant.create!(
  nickname: "Big Monstera",
  remarks: "Located in the balcony, need lots of water",
  user: user1,
  plant_info: plant_infos2,
  watering_frequency: 7,
  start_date: Date.today + 1.days
)

Plant.create!(
  nickname: "Monstera Light Green",
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

5.times do
  Plant.create!(
    nickname: Faker::Lorem.sentence(word_count: 3),
    remarks: Faker::Quote.famous_last_words,
    user: user3,
    plant_info: [plant_infos1, plant_infos2, plant_infos3, plant_infos4, plant_infos5, plant_infos6, plant_infos7, plant_infos8, plant_infos9, plant_infos10].sample,
    watering_frequency: 1,
    start_date: Date.today
  )
end

5.times do
  Plant.create!(
    nickname: Faker::Lorem.sentence(word_count: 3),
    remarks: Faker::Quote.famous_last_words,
    user: user3,
    plant_info: [plant_infos1, plant_infos2, plant_infos3, plant_infos4, plant_infos5, plant_infos6, plant_infos7, plant_infos8, plant_infos9, plant_infos10].sample,
    listing: true,
    watering_frequency: 2,
    start_date: Date.today
  )
end

5.times do
  Plant.create!(
    nickname: Faker::Lorem.sentence(word_count: 3),
    remarks: Faker::Quote.famous_last_words,
    user: user3,
    plant_info: [plant_infos1, plant_infos2, plant_infos3, plant_infos4, plant_infos5, plant_infos6, plant_infos7, plant_infos8, plant_infos9, plant_infos10].sample,
    listing: true,
    watering_frequency: 2,
    start_date: Date.today
  )
end

5.times do
  Plant.create!(
    nickname: Faker::Lorem.sentence(word_count: 3),
    remarks: Faker::Quote.famous_last_words,
    user: user4,
    plant_info: [plant_infos1, plant_infos2, plant_infos3, plant_infos4, plant_infos5, plant_infos6, plant_infos7, plant_infos8, plant_infos9, plant_infos10].sample,
    watering_frequency: 3,
    start_date: Date.today
  )
end

5.times do
  Plant.create!(
    nickname: Faker::Lorem.sentence(word_count: 3),
    remarks: Faker::Quote.famous_last_words,
    user: user4,
    plant_info: [plant_infos1, plant_infos2, plant_infos3, plant_infos4, plant_infos5, plant_infos6, plant_infos7, plant_infos8, plant_infos9, plant_infos10].sample,
    listing: true,
    watering_frequency: 4,
    start_date: Date.today
  )
end

5.times do
  Plant.create!(
    nickname: Faker::Lorem.sentence(word_count: 3),
    remarks: Faker::Quote.famous_last_words,
    user: user4,
    plant_info: [plant_infos1, plant_infos2, plant_infos3, plant_infos4, plant_infos5, plant_infos6, plant_infos7, plant_infos8, plant_infos9, plant_infos10].sample,
    listing: true,
    watering_frequency: 4,
    start_date: Date.today
  )
end

3.times do
  Plant.create!(
    nickname: Faker::Lorem.sentence(word_count: 3),
    remarks: Faker::Quote.famous_last_words,
    user: user5,
    plant_info: [plant_infos1, plant_infos2, plant_infos3, plant_infos4, plant_infos5, plant_infos6, plant_infos7, plant_infos8, plant_infos9, plant_infos10].sample,
    listing: true,
    watering_frequency: 1,
    start_date: Date.today
  )
end

3.times do
  Plant.create!(
    nickname: Faker::Lorem.sentence(word_count: 3),
    remarks: Faker::Quote.famous_last_words,
    user: user5,
    plant_info: [plant_infos1, plant_infos2, plant_infos3, plant_infos4, plant_infos5, plant_infos6, plant_infos7, plant_infos8, plant_infos9, plant_infos10].sample,
    listing: true,
    watering_frequency: 1,
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

# randomly assign illness to 1 plant of user1 and user2
user1_plants = Plant.where(user: user1).sample(1)
user2_plants = Plant.where(user: user2).sample(1)

PlantIllness.create!(
  illness: illness_funghi,
  plant: user1_plants[0]
)

PlantIllness.create!(
  illness: illness_browning,
  plant: user2_plants[0]
)

# create marketplace offers, 1 for each status type.
# pending offers: each offer 2 options
# other offers: each offer 1 option

# user4_lister_plants = Plant.where(listing: true).sample(4)
# user3_buyer_plants = Plant.where(listing: true).sample(4)

# offer_pending =
#   Offer.create!(
#     accepted: "pending",
#     lister_plant: user4_lister_plants[0],
#     buyer_plant: nil,
#     lister: user4,
#     buyer: user3
#   )

# OfferingOption.create!(
#   offer: offer_pending,
#   plant: user3_buyer_plants[0]
# )

# OfferingOption.create!(
#   offer: offer_pending,
#   plant: user3_buyer_plants[1]
# )

# offer_pending2 =
#   Offer.create!(
#     accepted: "pending",
#     lister_plant: user4_lister_plants[1],
#     buyer_plant: nil,
#     lister: user4,
#     buyer: user3
#   )

# OfferingOption.create!(
#   offer: offer_pending2,
#   plant: user3_buyer_plants[0]
# )

# OfferingOption.create!(
#   offer: offer_pending2,
#   plant: user3_buyer_plants[1]
# )

# offer_rejected =
#   Offer.create!(
#     accepted: "rejected",
#     lister_plant: user4_lister_plants[2],
#     buyer_plant: nil,
#     lister: user4,
#     buyer: user3
#   )

# OfferingOption.create!(
#   offer: offer_rejected,
#   plant: user3_buyer_plants[2]
# )

# offer_accepted =
#   Offer.create!(
#     accepted: "accepted",
#     lister_plant: user4_lister_plants[3],
#     buyer_plant: user3_buyer_plants[3],
#     lister: user4,
#     buyer: user3
#   )

# OfferingOption.create!(
#   offer: offer_accepted,
#   plant: user3_buyer_plants[3]
# )

# create buddies

buddy = Buddy.create!(
  name: "Zi Jie",
  email: "ng_zi_jie@hotmail.com",
  hp: 94373184,
  user: user1,
)

buddy = Buddy.create!(
  name: "Feng Yong",
  email: "fengrenaaa@gmail.com",
  hp: 91234567,
  user: user1,
)

buddy = Buddy.create!(
  name: "Clifton Ng",
  email: "ng_zi_jie@hotmail.com",
  hp: 91122345,
  user: user2,
)

puts "seeding entries done!"
