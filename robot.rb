class Robot
  attr_accessor :x ,:y, :direction, :args

  def initialize()
    @x = 0
    @y = 0
    @direction = "NORTH"
  end

  def read_command(string)
    @commandargs = string.split(" ")
    @command = @commandargs[0]
    if @command == "PLACE"
      self.place()
    elsif @command == "MOVE"
      self.move()
    elsif @command == "REPORT"
      self.report()
    elsif @command == "LEFT"
      self.left()
    elsif @command == "RIGHT"
      self.right()
    else
      self.invalid_command()
    end
  end

  def place()
    @args = @commandargs[1].split(",")
    x,y = @args[0].to_i,args[1].to_i
    if self.check_on_board(x,y)
      @x,@y = x,y
      @direction = args[2]
    else
      return
    end
  end

  def move()
    x,y = @x,@y
    if @direction == "NORTH"
      y = y + 1
    elsif @direction == "SOUTH"
      y = y - 1
    elsif @direction == "EAST"
      x = x + 1
    elsif @direction == "WEST"
      x = x - 1
    else
      self.invalid_direction()
    end
    if check_on_board(x,y)
      @x,@y = x,y
    else
      return
    end
  end

  def report()
    if self.check_on_board(x,y)
      text = "Output: #{@x}, #{@y}, #{@direction}"
    else
      text = "Not on board"
    end
    return text
  end

  def left()
    if self.check_on_board(x,y)
      @x,@y = x,y
    else
      return
    end
    if @direction == "NORTH"
      @direction = "WEST"
    elsif @direction == "EAST"
      @direction == "NORTH"
    elsif @direction == "SOUTH"
      @direction == "WEST"
    elsif @direction == "WEST"
      @direction == "SOUTH"
    end
  end

  def right()
    if self.check_on_board(x,y)
      @x,@y = x,y
    else
      return
    end
    if @direction == "NORTH"
      @direction = "EAST"
    elsif @direction == "EAST"
      @direction == "SOUTH"
    elsif @direction == "SOUTH"
      @direction == "WEST"
    elsif @direction == "WEST"
      @direction == "NORTH"
    end
  end

  def check_on_board(x,y)
    return (x >=0 && x<=5)&&( y>=0 && y<=5)
  end

  def invalid_direction()
    return "Invalid Direction"
  end
  def invalid_command()
    return "Invalid Command"
  end
end
