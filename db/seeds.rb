Player.destroy_all
Champ.destroy_all
Roster.destroy_all
Wish.destroy_all
Skin.destroy_all


number_players = 50
number_champs = 75

number_players.times do
    Player.create(
        username: Faker::Name.name,
        password: Faker::Internet.password
    )
end

number_champs.times do
    Champ.create!(
        name: Faker::Games::LeagueOfLegends.champion,
        price: Faker::Number.number(digits: 4)
    )
end

100.times do
    Roster.create(
        player_id: Player.ids.sample,
        champ_id: Champ.ids.sample
    )
end

100.times do
    Wish.create(
        player_id: Player.ids.sample,
        champ_id: Champ.ids.sample,
        rank: rand(1..10)
    )
end

100.times do
    Skin.create(
        name: Faker::Cannabis.strain,
        cost: Faker::Number.number(digits: 3),
        champ_id: Champ.ids.sample
    )
end