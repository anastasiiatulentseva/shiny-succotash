class CustomerListGetter
  def self.list
    customer_list = File.readlines('customers.txt')
    customer_list.map do |line|
      line = JSON.parse(line)
      line['longitude'] = line['longitude'].to_f
      line['latitude'] = line['latitude'].to_f
      line
    end
  end
end

# p CustomerListGetter.list #=>
