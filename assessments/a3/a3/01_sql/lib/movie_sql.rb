require 'singleton'
require 'sqlite3'

class MovieDatabase < SQLite3::Database
  include Singleton

  def initialize
    super(File.dirname(__FILE__) + "/../movie.db")

    self.results_as_hash = true
    self.type_translation = true
  end

  def self.execute(*args)
    self.instance.execute(*args)
  end
end

# 1. Obtain the cast list for the movie "Zoolander"; order by the
# actor's name.
def zoolander_cast
  MovieDatabase.execute(<<-SQL)
    select actors.name
    from movies
      join castings on castings.movie_id = movies.id
      join actors on castings.actor_id = actors.id
    where
      movies.title = 'Zoolander'
    order by actors.name
SQL
end

# 2. List the films in which 'Harrison Ford' has appeared; order by
# movie title.
def harrison_ford_films
  MovieDatabase.execute(<<-SQL)
    select movies.title
    from movies
      join castings on castings.movie_id = movies.id
      join actors on castings.actor_id = actors.id
    where
      actors.name = 'Harrison Ford'
    order by movies.title
SQL
end

# 3. List the films in which 'Denzel Washington' has appeared, but not
#    in the leading role. Order by movie title.
def denzel_washington_non_starring_films
  MovieDatabase.execute(<<-SQL)
    select movies.title
    from movies
      join castings on castings.movie_id = movies.id
      join actors on castings.actor_id = actors.id
    where
      actors.name = 'Denzel Washington' and
      castings.ord != 1
    order by
    movies.title
SQL
end

# 4. List the films together with the leading star for all 1962
# films. Order by movie title.
def leading_star_for_1962_films
  MovieDatabase.execute(<<-SQL)
    select
      movies.title,
      actors.name
    from
      movies
      join castings on castings.movie_id = movies.id
      join actors on castings.actor_id = actors.id
    where
      movies.yr = 1962 and castings.ord = 1
    order by movies.title
SQL
end

# 5. There is a film from 2012 in our database for which there is no
# associated casting information. Give the id and title of this movie.
def unknown_actors_2012
  MovieDatabase.execute(<<-SQL)
    select
      movies.id,
      movies.title
    from movies
      left outer join castings on castings.movie_id = movies.id
    where
      movies.yr = 2012 and
      castings.movie_id is null
SQL
end

# 6. List the movie title and starring actor (ord = 1) for films with 70
#    or more cast members. Order by movie title.
#
#    NB: Make sure you group by movie id
#    and not by movie title (what if there are remakes?).

def big_movie_stars
  MovieDatabase.execute(<<-SQL)
    select
      big_movies.movie_title as title,
      actors.name as name
    from
      (
        select
          movies.id as movie_id,
          movies.title as movie_title
        from movies
          join castings on castings.movie_id = movies.id
          join actors on castings.actor_id = actors.id
        group by movies.id
        having count(castings.actor_id) >= 70
      ) as big_movies

      join castings on castings.movie_id = big_movies.movie_id
      join actors on castings.actor_id = actors.id
    where
      castings.ord = 1
SQL
end

# 7. List the film title and the leading actor for all of the films
# 'Julie Andrews' played in. Order by movie title name. Be careful!
# There is a movie (Pink Panther) in which Julie Andrews appears in
# two roles; do not double count the star of that film (Peter
# Sellers).
def julie_andrews_stars
  MovieDatabase.execute(<<-SQL)
    select
      DISTINCT(jul_movies.movie_title) as title,
      actors.name as name
    from
      (
        select
          movies.id as movie_id,
          movies.title as movie_title
        from movies
          join castings on castings.movie_id = movies.id
          join actors on castings.actor_id = actors.id
        where
          actors.name = 'Julie Andrews'
      ) as jul_movies

      join castings on castings.movie_id = jul_movies.movie_id
      join actors on castings.actor_id = actors.id
    where
      castings.ord = 1
SQL
end

# 8. There is a movie in which 'Barrie Ingham' plays two roles. Write a
# query that returns the title of this movie.
def barrie_ingham_multiple_roles
  MovieDatabase.execute(<<-SQL)
    select
      movies.title
    from movies
      join castings on castings.movie_id = movies.id
      join actors on castings.actor_id = actors.id
    where
      actors.name = 'Barrie Ingham'
    group by
      movies.id
    having
      count(castings.actor_id) = 2
SQL
end
