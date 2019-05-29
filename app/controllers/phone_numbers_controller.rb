class PhoneNumbersController < ApplicationController

  # before_action :fetch_resource, :unauthorized_access

	def create
		user = User.find(params[:user_id])
		if params[:p_number]
			phone_number = PhoneNumber.find_by(p_number: params[:p_number])
			if phone_number
				json_response({
            success: false,
            message: "Sorry, This number already occupied to some other user."
        }, 422)
			else
				user.phone_numbers.create!(p_number: params[:p_number])
				render_success_response({}, "Phone number allocated Successfully ", 200)
			end
		else
			user.phone_numbers.create!(p_number: rand(1111111111..9999999999))
	    render_success_response({user: user, phone_numbers: user.phone_numbers}, "Phone number allocated Successfully ", 200)
		end
	end

  private

  def p_params
    params.permit(:p_number, :user_id)
  end
end