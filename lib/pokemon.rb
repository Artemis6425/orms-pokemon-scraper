class Pokemon
    attr_accessor :id, :name, :type, :db
    def initialize(hash)
        @id = hash[:id]
        @name = hash[:name]
        @type = hash[:type]
        @db = hash[:db]
    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = #{id}"
        
        x = db.execute(sql)
        y = {
            id: x[0][0],
            name: x[0][1],
            type:x[0][2]
        }
        z = Pokemon.new(y)
        return z
    end
end
