require_relative "robot.rb"
require "test/unit"

class TestCommands < Test::Unit::TestCase

  def setup
    @commands_1 = ["PLACE 0,0,NORTH","MOVE","REPORT"]
    @commands_2 = ["PLACE 0,0,NORTH","LEFT","REPORT"]
    @commands_3 = ["PLACE 1,2,EAST","MOVE","MOVE","LEFT","MOVE","REPORT"]
    @commands_4 = ["PLACE 5,5,NORTH","MOVE","MOVE","REPORT"]
  end

  def execute(commands)
    @robot = Robot.new()
    for command in commands do
      @robot.read_command(command)
      if command == "REPORT"
        output = @robot.report()
        break
      end
    end
    return output
  end

  def test_commands
    assert_equal("Output: 0,1,NORTH", execute(@commands_1))
    assert_equal("Output: 0,0,WEST", execute(@commands_2))
    assert_equal("Output: 3,3,NORTH", execute(@commands_3))
    assert_equal("Not on board", execute(@commands_4))
  end

end
