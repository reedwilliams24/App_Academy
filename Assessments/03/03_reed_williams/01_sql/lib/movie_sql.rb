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

# 1. Obtain the cast list for the movie 'Rain Man'; order by the actors'
#    names.
def rain_man_cast
  MovieDatabase.execute(<<-SQL)
    SELECT
      actor.name
    FROM
      actor
    JOIN casting
      ON actor.id = casting.actorid
    JOIN movie
      ON movie.id = casting.movieid
    WHERE
      movie.title = 'Rain Man'
    ORDER BY
      actor.name ASC
  SQL
end

# 2. List the films in which 'Harrison Ford' has appeared; order by
# movie title.
def harrison_ford_films
  MovieDatabase.execute(<<-SQL)
    SELECT
      movie.title
    FROM
      movie
    JOIN casting
      ON casting.movieid = movie.id
    JOIN actor
      ON casting.actorid = actor.id
    WHERE
      actor.name = 'Harrison Ford'
    ORDER BY
      movie.title ASC
  SQL
end

# 3. List the films where 'Matt Damon' has appeared, but not in the
# star role. Order by movie title.
def matt_damon_supporting_actor_films
  MovieDatabase.execute(<<-SQL)
    SELECT
      movie.title
    FROM
      movie
    JOIN casting
      ON casting.movieid = movie.id
    JOIN actor
      ON casting.actorid = actor.id
    WHERE
      actor.name = 'Matt Damon' AND casting.ord <> 1
    ORDER BY
      movie.title
  SQL
end

# 4. List the films together with the leading star for all 1962
# films. Order by movie title.
def leading_star_for_1962_films
  MovieDatabase.execute(<<-SQL)
    SELECT
      movie.title, actor.name
    FROM
      movie
    JOIN casting
      ON movie.id = casting.movieid
    JOIN actor
      ON casting.actorid = actor.id
    WHERE
      movie.yr = 1962 AND casting.ord = 1
    ORDER BY
      movie.title ASC
  SQL
end

# 5. There is a movie from 1920 in our database for which there is no
#    associated casting information. Give the title of this movie.
def no_casting_info
  MovieDatabase.execute(<<-SQL)
    SELECT
      DISTINCT movie.title
    FROM
      movie
    LEFT OUTER JOIN casting
      ON casting.movieid = movie.id
    WHERE
      casting.ord IS NULL AND movie.yr = 1920
  SQL
end

# 6. Which films have more than 60 roles? List the movie title and
# number of roles. Order by movie title.
def big_movies
  MovieDatabase.execute(<<-SQL)
    SELECT
      movie.title, COUNT(*) AS roles
    FROM
      movie
    JOIN casting
      ON movie.id = casting.movieid
    GROUP BY
      movie.id
    HAVING
      COUNT(*) > 60
    ORDER BY
      movie.title ASC
  SQL
end

# 7. List the movie year, movie title, and supporting actor (ord = 2)
# for all of the films in which Will Smith played the star role
# (ord = 1). Order by the name of the supporting actor.
def will_smith_supporting_actors
  MovieDatabase.execute(<<-SQL)
    SELECT
      movie.yr, movie.title, supporting_actor.name
    FROM
      movie
    JOIN casting AS will_casting
      ON movie.id = will_casting.movieid
    JOIN actor AS will_actor
      ON will_casting.actorid = will_actor.id
    JOIN casting AS supporting_casting
      ON movie.id = supporting_casting.movieid
    JOIN actor AS supporting_actor
      ON supporting_casting.actorid = supporting_actor.id
    WHERE
      will_actor.name = 'Will Smith' AND supporting_casting.ord = 2 AND will_casting.ord = 1
    ORDER BY
      supporting_actor.name ASC
  SQL
end

# 8. Which were the busiest years for 'John Travolta'? List the year
# and the number of movies he made each year, for any year in which he
# made >2 movies. Order by year.
def busiest_john_travolta_years
  MovieDatabase.execute(<<-SQL)
    SELECT
      movie.yr, COUNT(*) AS count
    FROM
      movie
    JOIN casting
      ON movie.id = casting.movieid
    JOIN actor
      ON casting.actorid = actor.id
    WHERE
      actor.name = 'John Travolta'
    GROUP BY
      movie.yr
    HAVING
      COUNT(*) > 2
    ORDER BY movie.yr
  SQL
end
