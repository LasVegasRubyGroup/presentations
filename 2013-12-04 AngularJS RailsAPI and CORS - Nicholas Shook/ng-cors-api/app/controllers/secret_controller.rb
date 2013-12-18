class SecretController < ActionController::API
  @@SECRET_PASSWORD = 'open-sesame'
  def index
    if params[:password] == @@SECRET_PASSWORD
      render status: 200, json: {answer: 'You may now enter'}
    else
      render status: 403, json: {answer: '...'}
    end
  end
end
