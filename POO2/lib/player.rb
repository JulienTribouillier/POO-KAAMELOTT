class Player

  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_states
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(hurt)
    @life_points = @life_points - hurt
    if @life_points <= 0
      puts "#{name} a été tué !"
    end
  end

  def attacks(attacked_player)
    print "Le joueur #{@name} attaque le joueur #{attacked_player.name} ! "
    damage = compute_damage
    attacked_player.gets_damage(damage)
    if attacked_player.life_points > 0
      print  "Il lui inflige #{damage} points de dommages !\n"
    else
      exit
    end
  end


  def compute_damage
    return rand(1..6)
  end

  
end

class HumanPlayer
  attr_accessor :name, :life_points, :weapon_level

  def initialize(name)
    @name=name
    @life_points=100
    @weapon_level=1
  end

  def show_states
    puts "#{@name} a #{@life_points} points de vie, et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def gets_damage(hurt)
    @life_points = @life_points - hurt
    if @life_points <= 0
      puts "#{name} a été tué !"
    end
  end

  def attacks(attacked_player)
    print "Le joueur #{@name} attaque le joueur #{attacked_player.name} ! "
    damage = compute_damage
    attacked_player.gets_damage(damage)
    if attacked_player.life_points > 0
      print  "Il lui inflige #{damage} points de dommages !\n"
    else
      exit
    end
  end

  def search_weapon
    launch = rand(1..6) 
    puts "Tu as trouvé une arme de niveau #{launch}"
    if launch > @weapon_level
      puts "Cette arme est meilleure que l'ancienne, tu la prends"
      @weapon_level = launch
    else
      puts "Cette arme est toute moisie, c'est pas Escalimbur"
    end

  end

  def search_health_pack
    launch_health = rand(1..6) 
    if launch_health == 1 
      puts "Tu n'as rien trouvé!"
    elsif launch_health >= 2 && launch_health <=5
      puts "Tu as trouvé du lait de chèvre, tu te soignes de 50 points de vie"
      if @life_points > 50
        @life_points = 100
        puts "Tu as retrouvé toute ta santé"
      else
        new_life = @life_points += 50
        puts "Tu viens de remonter à #{new_life} points de vie"
      end
    elsif launch_health == 6
      puts "Tu n'as pas trouvé le Gral, mais pas loin, tu te soignes de 80 points de vie!!!!"
      if @life_points > 20
        @life_points = 100
        puts "Tu as retrouvé toute ta santé"
      else
        new_life = @life_points += 80
        puts "Tu viens de remonter à #{new_life} points de vie"
      end
    end
  end
end
