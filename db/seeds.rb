# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

youtube_links = [
  {
    url: 'https://www.youtube.com/watch?v=XC7dagtU_Lk',
    title: 'Marlon Wayans on Eddie Murphy Visiting Him in the Projects and Finally Making Him Laugh',
    description: "Marlon Wayans talks about the time he and his brothers comedy-roasted Eddie Murphy when he visited them at home and channeling his idol by playing multiple characters in Netflix's Sextuplets."
  },
  {
    url: 'https://www.youtube.com/watch?v=9DtcSCFwDdw',
    title: "You Don't Find Happiness, You Create It",
    description: "Why is it so hard to find that life of meaning, and connection, and happiness we long for? Why can't we just live in our 'happy place' all the time?
According to psychologist Katarina Blom, the brain is not always on your side when it comes to well-being. Survival, absolutely. The rest, not so much. But there is hope! "
  },
  {
    url: 'https://www.youtube.com/watch?v=MY5SatbZMAo&t=88s',
    title: 'What makes you special? ',
    description: "NBC News journalist Mariana Atencio has traveled the world from Haiti to Hong Kong. In her TEDx talk, Mariana tells us how the people she's met along the way and her own immigrant experience have taught her that the only thing we all have in common is being human. Get ready to 'get human' and embrace what makes you different! Take a stand to defend your race: the human race!"
  },
  {
    url: 'https://www.youtube.com/watch?v=HsQmtG1fnqc&t=43s',
    title: 'What If You Fell out of an Airplane at 30,000 Feet?',
    description: "30,000 feet, 9,144 meters, 9 kilometers or 5.7 miles - so far, only one person has ever survived a free fall from that height. Would you be as lucky? On January 26, 1972, an explosion aboard J.A.T. airways flight 367 resulted in the impossible. 22-year-old flight attendant Vesna Vulovic, fell from 10,000 meters (33,000 feet) in the air, setting a world record for surviving the highest fall without a parachute. How did she survive?"
  },
  {
    url: 'https://www.youtube.com/watch?v=1LdeBY9uNUg',
    title: 'What If the Earth Collided With Another Planet?',
    description: "Last time a stray planetoid the size of Mars smashed into Earth, it scattered our planet's young crust into space, where gravity glued those particles into what we now call the Moon.This time, it would be all hellfire and brimstone with no survivors left. And here's a timeline of how things break down..."
  },
  {
    url: 'https://www.youtube.com/watch?v=_vId_4r925o',
    title: 'Kate Winslet - What If - Official Music Video',
    description: "What if I could change the path of time? What if I had the power to decide? What if I could make us unified? If I, if I What if we would open up the doors? What if we could help each other more? What if I could make you all believe? If we, if we "
  }
]

youtube_links.each do |link|
  user = FactoryBot.create(:user)
  user.shares.create(link)
end
