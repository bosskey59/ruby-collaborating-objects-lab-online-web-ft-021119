require "pry"
class Song

    attr_accessor :name, :artist

    def initialize(name)
        @name = name
    end

    def self.new_by_filename(filename)
        array = filename.split(/[-.]/)
        @artist_name_string = array[0].strip
        @song_name_string = array[1].strip
        #creating song
        @song = Song.new(@song_name_string)
        #find out if artist already exists, if not than create said artist
        @artist = Artist.find_or_create_by_name(@artist_name_string)
        # save then pushes this freshly creates instance into the @@all of Artist
        @artist.save
        # for artist to keep track it's songs [] << @song
        @artist.add_song(@song)
        # this this song belongs to this instance of an artist
        @song.artist = @artist
        #returns song
        @song
    end

end