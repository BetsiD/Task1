class Users::RegistrationsController < Devise::RegistrationsController
   before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  #before_action :configure_sign_up_params, if: :devise_controller?
  #before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    @user = User.new(configure_sign_up_params)
    
       @user.save!
       redirect_to blogs_path
        #format.html { redirect_to blogs_path, notice: 'Pony was successfully created.' }
        #format.json { render :show, status: :created, location: @pony }
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected

  # If you have extra params to permit, append them to the sanitizer.
  #def configure_sign_up_params
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    #attribute = [:email, :encrypted_password]
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:arr])
    #devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    #user_params.permit(:name, :contact, :email, :encrypted_password, :address)
    #params.require(:user).permit(:name, :contact, :email, :encrypted_password, :address)
    #devise_parameter_sanitizer.for(:sign_up).push(:name, :contact, :email, :encrypted_password, :address)
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :contact, :address])
  #end

  def configure_sign_up_params
     #devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
     devise_parameter_sanitizer.for(:sign_up).push(:name, :contact, :address)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
