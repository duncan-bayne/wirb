require 'net/http'

uri = URI 'http://localhost:4567/wirb'

# terminate STDIN.gets with a double newline instead of the default single
$/ = "\n\n"  

def welcome
  puts "Enter your Ruby commands, finishing with a double-newline."
  puts "Meta-commands are prefixed with :.  Try :help or :quit."
end

def run_remote uri, command
  puts (Net::HTTP.post_form uri, :command => command).body
end

def wirb_command command
  case command
  when ':quit'
    exit 0
  when ':help'
    puts ":quit\tExits wirb"
    puts ":help\tDisplays help"
  else
    puts "wirb: unknown command #{command}"
  end
end

welcome
while true
  print "\n> "
  command = STDIN.gets.strip
  if command.start_with? ':'
    wirb_command command
  else 
    run_remote uri, command
  end
end
