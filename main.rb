require_relative "robot.rb"

def main()
  @robot = Robot.new()
  while(true)
    command = gets.chomp()
    @robot.read_command(command)
    if command == "REPORT"
      break
    end
  end
  puts @robot.report()
end

main()
