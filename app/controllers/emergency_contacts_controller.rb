class EmergencyContactsController < ApplicationController
  def index
    @emergency_contacts = EmergencyContact.all
  end

  def show
    @emergency_contact = EmergencyContact.find(params[:id])
  end

  def new
    @emergency_contact = EmergencyContact.new
  end

  def edit
    @emergency_contact = EmergencyContact.find(params[:id])
  end

  def create
    @emergency_contact = EmergencyContact.new(params[:emergency_contact])
    if @emergency_contact.save
      redirect_to @emergency_contact, notice: 'Emergency contact was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @emergency_contact = EmergencyContact.find(params[:id])
    if @emergency_contact.update_attributes(params[:emergency_contact])
      redirect_to @emergency_contact, notice: 'Emergency contact was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @emergency_contact = EmergencyContact.find(params[:id])
    @emergency_contact.destroy
  end
end
