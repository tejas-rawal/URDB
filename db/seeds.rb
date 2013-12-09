# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Removing existing Movies (if they currently exist)"
Movie.destroy_all

movies = [
  { title: "Gladiator",
    poster_url: "http://www.movieposter.com/posters/archive/main/22/A70-11370",
    trailer_url: "http://youtu.be/ol67qo3WhJk",
    description: "When a Roman general is betrayed and his family murdered by an emperor's corrupt son, he comes to Rome as a gladiator to seek revenge."
  },
  { title: "Hackers",
    poster_url: "http://www.movieposter.com/posters/archive/main/79/MPW-39928",
    trailer_url: "http://youtu.be/pP6iTjhlOvs",
    description: "A young boy is arrested by the US Secret Service for writing a computer virus and is banned from using a computer until his 18th birthday. Years later, he and his new-found friends discover a plot to unleash a dangerous computer virus, but they must use their computer skills to find the evidence while being pursued by the Secret Service and the evil computer genius behind the virus."
  },
  {
    title: "The Social Network",
    poster_url: "http://www.movieposter.com/posters/archive/main/109/MPW-54712",
    trailer_url: "http://youtu.be/lB95KLmpLR4",
    description: "Harvard student Mark Zuckerberg creates the social networking site that would become known as Facebook, but is later sued by two brothers who claimed he stole their idea, and the cofounder who was later squeezed out of the business."
  },
  {
    title: "Pirates of Silicon Valley",
    poster_url: "http://i2.listal.com/image/34728/600full-pirates-of-silicon-valley-poster.jpg",
    trailer_url: "http://youtu.be/lEyrivrjAuU",
    description: "The revolution came when we weren't looking. It happened in a garage. In a dorm room. In countless hours of effort, imagining and intrigue. Apple co-founder Steve Jobs and Microsoft co-founder Bill Gates were changing the way the world works, lives and communicates."
  },
  {
    title: "Swordfish",
    poster_url: "http://www.movieposter.com/posters/archive/main/3/MPW-1879",
    trailer_url: "http://youtu.be/mfLizCqjz18",
    description: "A secretive renegade counter-terrorist co-opts the world's greatest hacker (who is trying to stay clean) to steal billions in US Government dirty money."
  }
]

puts "Creating Movies"
movies.each do |movie|
  Movie.create(movie)
end

puts "#{Movie.all.count} Movies created"
