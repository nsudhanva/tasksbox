# Update - SAVE ALSO ACTS AS UPDATE

client = Client.first 
client.name = "Vinod"
client.save

# Alternative and day to day
client = Client.last
client.update_attributes(name: "Balram")

#Destroy - deletes the element
project = Project.last

#Destroys the object in table but states in variable (Frozen State)
project.destroy

#Cant modify frozen (only read)