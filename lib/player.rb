class HumanPlayer
  def initialize(name)
    @name = name
  end

  def get_play
    print "Please set your target (e.g. 0, 1): "
    gets.chomp.split(", ").map(&:to_i)
  end
end
