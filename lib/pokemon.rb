class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db, hp)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?,?)", name, type, hp)
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db: db, hp: new_pokemon[3])
  end
end
