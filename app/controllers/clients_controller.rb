class ClientsController < ApplicationController
	def index
		@clients = Client.all
	end

	def new
		@client = Client.new 		
	end

	def create
		@client = Client.new(client_params)

		if @client.save
			redirect_to clients_path
		else
			render action: "new"
		end
	end

	def show
		@client = Client.find(params[:id])
	end

	def edit
		@client = Client.find(params[:id])
	end

	def update
		@client = Client.find(params[:id])

		if @client.update_attributes(client_params)
			redirect_to client_path(@client.id), notice: "Successfully updated"
		else
			render action: "new"
		end
	end

	def destroy
		@client = Client.find(params[:id])

		if @client.destroy
			redirect_to clients_path, notice: "Suvcessfully deleted"
		end
	end

	private 
		def client_params
			params[:client].permit(:name, :company, :email, :mobile)
			#Any data from form
		end
end
