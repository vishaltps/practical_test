module CustomTokenResponse
  def body
    user_details = User.find(@token.resource_owner_id).as_json
    # { token: super, user: user_details }
    { 
      success: true,
      message: "",
      data: {
        token: super,
        user: user_details
      },
      meta: [],
      errors: []
    }
  end
end