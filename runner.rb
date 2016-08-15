#Do not modify this code unless you are attempting the Exceeds Expectation portion of the challenge.
require 'pry'
require 'csv'
require_relative 'album'
require_relative 'track'

albums = []

CSV.foreach('space_jams.csv', headers: true, header_converters: :symbol) do |row|
  # track = row.to_hash
  track = Track.new(row[:album_id], row[:track_id], row [:title], row[:track_number], row[:duration_ms])
  # find an album by matching the album.id with track[:album_id]
  album = albums.find { |a| a.id == track.album_id}
  # if the album hasn't been added to the albums array yet, add it
  if album.nil?
    album = Album.new(track.album_id, track.title, row[:artists])
    albums << album
  end
  # add the track to the album's @tracks instance variable
  album.tracks << track
end
# print out the summary for each album
albums.each do |album|
  puts album.summary
end
