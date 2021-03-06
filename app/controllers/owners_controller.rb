class OwnersController < ApplicationController
  get '/owners' do
    @owners = Owner.all
    erb :'/owners/index'
  end

  post '/owners' do
    @owner = Owner.create(params[:owner])
    unless params['pet']['name'].empty?
      @owner.pets << Pet.create(name: params['pet']['name'])
      @owner.save # saves to the database
    end
    redirect "owners/#{@owner.id}"
  end

  get '/owners/new' do
    @pets = Pet.all
    erb :'/owners/new'
  end

  get '/owners/:id' do
    @owner = Owner.find(params[:id])
    erb :'/owners/show'
  end

  post '/owners/:id' do
    @owner = Owner.find(params[:id])
    @owner.update(params['owner'])
    unless params['pet']['name'].empty?
      @owner.pets << Pet.create(name: params['pet']['name'])
    end
    redirect to "owners/#{@owner.id}"
  end

  get '/owners/:id/edit' do
    @owner = Owner.find(params[:id])
    erb :'/owners/edit'
  end


end
