# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
City.create(name: 'Austin, TX')

Neighborhood.create(name: 'Travis Heights',
                    description: 'Travis Heights is a nature-lover’s residential paradise. This invitingly walkable neighborhood’s mix of colorful bungalows and modern apartments is bordered by Lady Bird Lake and surrounded by leafy trees, expansive parks, and biking and jogging trails.',
                    city_id: 1)
Neighborhood.create(name: 'Barton Hills',
                    description: 'As Austin’s most nature-friendly neighborhood, Barton Hills boasts lush parks, cool pools, and prolific botanic gardens.',
                    city_id: 1)
Neighborhood.create(name: 'Old West Austin',
                    description: 'Old West Austin blends regal charm with laid-back nightlife. Bordering the lake and only minutes away from 6th Street, Old West Austin offers a winning combination of natural beauty and big-city urbanity.',
                    city_id: 1)
Neighborhood.create(name: 'Hancock',
                    description: 'Located just north of Downtown, Hancock is home to ambitious professionals, laid-back creative types, and University of Texas students. Getting around this residential neighborhood often involves walking, jogging, or biking to its local bars, cafes, and eateries.',
                    city_id: 1)
Neighborhood.create(name: 'Hyde Park',
                    description: 'In Hyde Park, you’re more likely to encounter articulate residents and local bakeries than noisy crowds and raucous bars. Small-town charm emanates from Hyde Park’s coffee shops and markets, and the neighborhood’s historic homes, well-tended lawns, and tree-shaded streets all contribute to its inviting walkability.',
                    city_id: 1)
Neighborhood.create(name: 'Bouldin Creek',
                    description: 'Bouldin Creek’s bright storefronts and eccentric art galleries garner this funky neighborhood its must-see status. Located directly across Lady Bird Lake from Downtown, Bouldin Creek blends central city convenience with edgy entertainment.',
                    city_id: 1)
Neighborhood.create(name: 'Clarksville',
                    description: 'As an inviting neighborhood mere steps away from famously entertaining 6th Street, Clarksville feels like a little village in the midst of an urban setting. This quirky neighborhood’s convenient location warrants its pedestrian-friendly attitude.',
                    city_id: 1)
Neighborhood.create(name: 'North Loop',
                    description: 'North Loop is North Austin’s answer to the edgy entertainment found south of Lady Bird Lake in SoCo. Walk into North Loop’s vintage stores, record shops, or hybrid coffee shop-cocktail spots, and you’ll set new trends upon exiting their brightly colored buildings.',
                    city_id: 1)
Neighborhood.create(name: 'Zilker',
                    description: 'Zilker is an enchanting neighborhood celebrated for its robust natural beauty and accessible creature comforts. Outdoor enthusiasts find endless enjoyment in nearby Barton Springs and Zilker Park, where runners, bikers, swimmers, Frisbee golfers, and kayakers share in their love for all things active.',
                    city_id: 1)
Neighborhood.create(name: 'Galindo',
                    description: 'Galindo’s community lives modestly, drives slowly, and relishes their neighborhood’s serenity a few miles away from Downtown. For playing or picnicking, South Austin Park provides ample recreational space.',
                    city_id: 1)


10.times do |num|
  user = User.create!(name: Faker::Name.name,
                      age: Faker::Number.between(16,84))
  10.times do
    vote = Vote.create!(ease: rand(1..5),
                        amenities: rand(1..5),
                        safety: rand(1..5),
                        user_id: user.id,
                        neighborhood_id: rand(1..10))
  end
end
