

# Player class
class Player
  def initialize(name,mark,score = 0)
    @name = name
    @mark = mark
    @score = score
  end

  def to_hash
    hash = {}
    symbols = {}
    instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
    hash.each {|key,var| symbols[key.to_sym] = var }
    symbols
  end
  
end
