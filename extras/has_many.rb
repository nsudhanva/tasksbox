client = Client.first

client.projects
#This will return an anrray of projects belonging to the client

project = Project.frst
project.client.name
#this will return the name of the client, it returns an error if project's client_id is nil
