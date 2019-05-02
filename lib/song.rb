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
  
  def self.new_from_filename(filename)
   
   info = filename.split(" - ")    #define a variable for what ur doing so it can be called below
   artist_name = info[0]
   song_name = info[1].gsub(".mp3", "")
   
   song = self.new
   song.name = song_name
   song.artist_name = artist_name
   song
   
   
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
