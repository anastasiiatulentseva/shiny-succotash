require 'bundler'
Bundler.require

Dir.glob('src/**/*.rb').each {|f| require_relative f }

if __FILE__ == $0
  file_path = 'data/customers.txt'
  input_file = File.new(file_path)
  all_customers = ::CustomerParser.new(input_file).parse
  invited_customers = InvitationList.new(users: all_customers, range: 100).invitable_users

  Formatter.new(invited_customers).format
end

