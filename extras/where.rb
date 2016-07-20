Project.where('client_id = ?', 3)
Project.where('client_id = ?', 450)

# Find all the porjects started from the month of the May
Project.where('start_date > ?', Date.parse("2016-05-01"))

# Find all the projects started for client id 3 from the month of May
Project.where('client_id = ? AND start_date = ?', 3, Date.parse("2016-05-01"))

#Find all the projects ended in the month of January
Project.where('end_date < ?', Date.parse("2016-01-01"))

#Find all the porjects started in the month of March
Project.where('start_date >= ? AND start_date <= ?', Date.parse("2016-03-01"), Date.parse("2016-03-31"))

#Alternative way
Project.where(start_date: Date.parse("2016-03-01")..Date.parse("2016-03-31"))

# Transfer all projects belonging client ID 1 to Client ID 5
client_1 = Project.where('client_id = ?', 1)

client_1.each do |client|
	client.update_attributes(client_id: 5)
end