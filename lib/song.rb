class Song
  attr_accessor :name, :artist_name
  @@all = []
 
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
  song = self.new
   song.save
   song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
   song = self.new
   song.name = name
   song.save
   song
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}

  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
        
    #check if arg song exists. if it doesnt create a new song. if it does return that song name
    # || means if "find by name" is falsey, then evaluate "create by name" against the argument and set it to the result. Equivalently, if "find by name" is truthy, then dont move on to evaluate "create by name" 
  end
    
  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end  
  
  def self.new_from_filename(filename) #
                                             # expected WANTS: "For Love I Come"
                                  #got: "Thundercat - For Love I Come.mp3" (split string apart -)
   info = filename.split(" - ")  #define a var "info" for what ur doing so it can be called below
   artist_name = info[0]                #Thundercat [0], For Love I Come.mp3[1]
   song_name = info[1].gsub(".mp3", "")   #.gsub will sub something for something .mp3 for nothing
   
   song = self.new                            #create new song
   song.name = song_name                      #song.name = song name from above : info[1].gsub
   song.artist_name = artist_name             #song.artistname = artist above : info 0
   song                                       #return that song with artist name acc to test
  end
  
  def self.create_from_filename(filename)
    song = self.new
   song.name = filename
   song.save
   song
  end
  
  def self.destroy_all
    self.all.clear
  end
end
