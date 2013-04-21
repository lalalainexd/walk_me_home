class EmergencyContactsController < ApplicationController
  def index
    @emergency_contacts = EmergencyContact.all
  end

  def show
    @emergency_contact = current_user.emergency_contacts
  end

  def new
    @emergency_contact = EmergencyContact.new
  end

  def edit
    @emergency_contact = EmergencyContact.find_by_user_id(current_user.id)
  end

  def create
    @emergency_contact = EmergencyContact.new(full_name: params[:emergency_contact][:full_name], phone_number: params[:emergency_contact][:phone_number], user_id: current_user.id)
    if @emergency_contact.save
      redirect_to user_path(current_user.id), notice: 'Emergency contact was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @emergency_contact = EmergencyContact.find_by_user_id(current_user.id)
    if @emergency_contact.update_attributes(params[:emergency_contact])
      redirect_to user_path(current_user.id), notice: 'Emergency contact was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @emergency_contact = EmergencyContact.find_by_user_id(current_user.id)
    @emergency_contact.destroy
    redirect_to user_path(current_user.id), notice: 'Emergency contact deleted.'
  end
end
