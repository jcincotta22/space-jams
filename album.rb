require 'pry'

class Album
  attr_accessor :id, :title, :artists, :tracks, :duration_min, :album_name
  def initialize(id, title, artists)
    @id = id
    @title = title
    @artists = artists
    @tracks = []
    @duration_min = duration_min
    @album_name = album_name
  end


  def summary
    total_duration = 0
    @tracks.each do |track|
      total_duration += track.duration_ms.to_f
    end
    @duration_min = total_duration/60000
    summary_string = "Name: #{@title}\n" + "Artist(s): #{@artists}\n" +
      "Duration (min.): " + "#{@duration_min.round(2)}\n" + "Tracks: \n"

    @tracks.each do |track|
      summary_string += "- " + track.title + "\n"
    end
    summary_string + "\n"
    end
end
