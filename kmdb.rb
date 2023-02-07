# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Movie.destroy_all
Cast.destroy_all
Studio.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!


new_studio = Studio.new
new_studio["studio"] = "Warner Bros."
new_studio.save

studioid = Studio.find_by({"studio" => "Warner Bros."})

new_movie = Movie.new
new_movie["title"] = "Batman Begins"
new_movie["year"] = "2005"
new_movie["rating"] = "PG-13"
new_movie["studio_id"] = studioid["id"]
new_movie.save

new_movie = Movie.new
new_movie["title"] = "The Dark Knight"
new_movie["year"] = "2008"
new_movie["rating"] = "PG-13"
new_movie["studio_id"] = studioid["id"]
new_movie.save

new_movie = Movie.new
new_movie["title"] = "The Dark Knight Rises"
new_movie["year"] = "2012"
new_movie["rating"] = "PG-13"
new_movie["studio_id"] = studioid["id"]
new_movie.save

puts "There are #{Movie.count} movies"

#BB Cast

new_cast = Cast.new
new_cast["actor"] = "Christian Bale"
new_cast.save

new_cast = Cast.new
new_cast["actor"] = "Michael Caine"
new_cast.save

new_cast = Cast.new
new_cast["actor"] = "Liam Neeson"
new_cast.save

new_cast = Cast.new
new_cast["actor"] = "Katie Holmes"
new_cast.save

new_cast = Cast.new
new_cast["actor"] = "Gary Oldman"
new_cast.save

#DK Cast

new_cast = Cast.new
new_cast["actor"] = "Heath Ledger"
new_cast.save

new_cast = Cast.new
new_cast["actor"] = "Aaron Eckhart"
new_cast.save

new_cast = Cast.new
new_cast["actor"] = "Maggie Gyllenhaal"
new_cast.save

#DKR Cast

new_cast = Cast.new
new_cast["actor"] = "Tom Hardy"
new_cast.save

new_cast = Cast.new
new_cast["actor"] = "Joseph Gordon Levitt"
new_cast.save

new_cast = Cast.new
new_cast["actor"] = "Anne Hathaway"
new_cast.save

puts "There are #{Cast.count} actors"

bwayneid = Cast.find_by({"actor" => "Christian Bale"})
alfredid = Cast.find_by({"actor" => "Michael Caine"})
rasid = Cast.find_by({"actor" => "Liam Neeson"})
rachelid = Cast.find_by({"actor" => "Katie Holmes"})
jokerid = Cast.find_by({"actor" => "Heath Ledger"})
twofaceid = Cast.find_by({"actor" => "Aaron Eckhart"})
maggieid = Cast.find_by({"actor" => "Maggie Gyllenhaal"})
baneid = Cast.find_by({"actor" => "Tom Hardy"})
josephid = Cast.find_by({"actor" => "Joseph Gordon Levitt"})
anneid = Cast.find_by({"actor" => "Anne Hathaway"})
gordonid = Cast.find_by({"actor" => "Gary Oldman"})

moviebb = Movie.find_by({"title" => "Batman Begins"})
moviedk = Movie.find_by({"title" => "The Dark Knight"})
moviedkr = Movie.find_by({"title" => "The Dark Knight Rises"})

#BB Chars

new_character = Role.new
new_character["character"] = "Bruce Wayne"
new_character["movie_id"] = moviebb["id"]
new_character["actor_id"] = bwayneid["id"]
new_character.save

new_character = Role.new
new_character["character"] = "Alfred"
new_character["movie_id"] = moviebb["id"]
new_character["actor_id"] = alfredid["id"]
new_character.save

new_character = Role.new
new_character["character"] = "Ra's Al Ghul"
new_character["movie_id"] = moviebb["id"]
new_character["actor_id"] = rasid["id"]
new_character.save

new_character = Role.new
new_character["character"] = "Rachel Dawes"
new_character["movie_id"] = moviebb["id"]
new_character["actor_id"] = rachelid["id"]
new_character.save

new_character = Role.new
new_character["character"] = "Commissioner Gordon"
new_character["movie_id"] = moviebb["id"]
new_character["actor_id"] = gordonid["id"]
new_character.save

#DK Chars

new_character = Role.new
new_character["character"] = "Bruce Wayne"
new_character["movie_id"] = moviedk["id"]
new_character["actor_id"] = bwayneid["id"]
new_character.save

new_character = Role.new
new_character["character"] = "Joker"
new_character["movie_id"] = moviedk["id"]
new_character["actor_id"] = jokerid["id"]
new_character.save

new_character = Role.new
new_character["character"] = "Harvey Dent"
new_character["movie_id"] = moviedk["id"]
new_character["actor_id"] = twofaceid["id"]
new_character.save

new_character = Role.new
new_character["character"] = "Alfred"
new_character["movie_id"] = moviedk["id"]
new_character["actor_id"] = alfredid["id"]
new_character.save

new_character = Role.new
new_character["character"] = "Rachel Dawes"
new_character["movie_id"] = moviedk["id"]
new_character["actor_id"] = maggieid["id"]
new_character.save

#DKR Chars

new_character = Role.new
new_character["character"] = "Bruce Wayne"
new_character["movie_id"] = moviedkr["id"]
new_character["actor_id"] = bwayneid["id"]
new_character.save

new_character = Role.new
new_character["character"] = "Commissioner Gordon"
new_character["movie_id"] = moviedkr["id"]
new_character["actor_id"] = gordonid["id"]
new_character.save

new_character = Role.new
new_character["character"] = "Tom Hardy"
new_character["movie_id"] = moviedkr["id"]
new_character["actor_id"] = baneid["id"]
new_character.save

new_character = Role.new
new_character["character"] = "John Blake"
new_character["movie_id"] = moviedkr["id"]
new_character["actor_id"] = josephid["id"]
new_character.save

new_character = Role.new
new_character["character"] = "Selina Kyle"
new_character["movie_id"] = moviedkr["id"]
new_character["actor_id"] = anneid["id"]
new_character.save

new_character.save

puts "There are #{Role.count} characters"


# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""


# Query the movies data and loop through the results to display the movies output.
# TODO!

warner = Studio.find_by({ "studio" => "Warner Bros." })

moviez = Movie.where({ "studio_id" => warner["id"] })

for movies in moviez
    title = movies["title"]
    year = movies["year"]
    rating = movies["rating"]
    studio = warner["studio"]
    puts "#{title} #{year} #{rating} #{studio}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

#moviez = Movie.where({ "studio_id" => warner["id"] })

for mov in moviez
    chars = Role.where({"movie_id" => mov["id"]})
        for actor in chars
            fullnames = Cast.find_by({"id" => actor["actor_id"]})
            movienames = Movie.find_by({"id" => actor["movie_id"]})
        end
        puts "#{movienames} #{fullnames} #{chars}"
    end