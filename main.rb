require_relative "robot.rb"

@robot = Robot.new()

# while(true)
#   command = gets.chomp()
#   robot.read_command(command)
#   if command == "REPORT"
#     puts robot.report()
#     break
#   end
# end
@commands_4 = ["PLACE 5,5,NORTH","REPORT"]

def execute(commands)
  for command in commands do
    @robot.read_command(command)
    if command == "REPORT"
      output = @robot.report()
      break
    end
  end
  return output
end

puts execute(@commands_4)
