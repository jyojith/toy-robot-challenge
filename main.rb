require_relative "robot.rb"

robot = Robot.new()

#print robot.report()
 while(true)
   command = gets.chomp()
   robot.read_command(command)
   if command == "REPORT"
     puts robot.report()
     break
   end
end
