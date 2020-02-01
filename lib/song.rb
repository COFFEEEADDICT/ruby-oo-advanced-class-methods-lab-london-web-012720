require "pry"

class Song

  attr_accessor :name, :artist_name

  @@all = []

  def save
  self.class.all << self
  end
  
  # def initialize(name)
  #   @name = name
  # end

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    return song
  end

  def self.new_by_name(name)
    song = self.new 
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name
    all << song
    song
  end

    def self.find_by_name(name_search)
      all.find { |names| names.name == name_search }
    end


    def self.find_or_create_by_name(name_in)
           if self.find_by_name(name_in)
            return self.find_by_name(name_in)
           else
              self.create_by_name(name_in)
           end   
    end            


    def self.alphabetical
         z = all.map { |a| a }
         z.sort_by { |o| o.name }
      #.name for just names
    end



    def self.new_from_filename(csv)
        #chomp from the end      
      splits = csv.chomp('.mp3').split(' - ')
      song = self.create
      song.name = splits[1]
      song.artist_name = splits[0]
      song
    end
    # splits = cvs.split(' - ') #=> ["Taylor Swift", "Blank Space.mp3"]
    # name = cvs[1].split('.mp3') #=> ["Blank Space"]
    # artist = cvs[0] #=> ["Taylor Swift"]

    def self.create_from_filename(csv)
        song = new_from_filename(csv)
        @@all << song
    end

     def self.destroy_all
       @@all.clear
     end

    # Song.new_by_name("mee")
    # Song.create_by_name("abakdo")
    # Song.create_by_name("scream")

 #binding.pry

#puts "end"

end 