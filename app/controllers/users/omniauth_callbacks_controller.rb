class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  def facebook
    puts "\n\n\n-------------------------------------------------------\n\n"
    puts       "------ The entire provider authentication return ------\n\n"
    puts request.env['omniauth.auth']
    puts     "\n-------------------------------------------------------\n\n\n"
    @user = User.from_omniauth(request.env["omniauth.auth"])
    puts "\n\n\n-------------------------------------------------------\n\n"
    puts       "------ The entire provider authentication return ------\n\n"
    puts @user.provider
    puts @user.uid
    puts @user.password
    puts @user.name
    puts @user.email
    puts @user.photo
    puts request.env['omniauth.auth'].info.image
    session[:myphoto] = request.env['omniauth.auth'].info.image
    puts @user.persisted?
    puts @user.save
    puts @user.persisted? || @user.save
    puts     "\n-------------------------------------------------------\n\n\n"


    if @user.persisted? || @user.save
      # sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      sign_in_and_redirect @user #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      # session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  def github
    # You need to implement the method below in your model (e.g. app/models/user.rb)

    puts "\n\n\n-------------------------------------------------------\n\n"
    puts       "------ The entire provider authentication return ------\n\n"
    puts request.env['omniauth.auth']
    puts     "\n-------------------------------------------------------\n\n\n"
    @user = User.from_omniauth(request.env["omniauth.auth"])
    puts "\n\n\n-------------------------------------------------------\n\n"
    puts       "------ The entire provider authentication return ------\n\n"
    puts @user.provider
    puts @user.uid
    puts @user.password
    puts @user.name
    puts @user.email
    puts @user.photo
    puts request.env['omniauth.auth'].info.image
    session[:myphoto] = request.env['omniauth.auth'].info.image
    puts @user.persisted?
    puts @user.save
    puts @user.persisted? || @user.save
    puts     "\n-------------------------------------------------------\n\n\n"

    if @user.persisted? || @user.save
      sign_in_and_redirect @user #this will throw if @user is not activated
      # sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
    else
      # session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)

    puts "\n\n\n-------------------------------------------------------\n\n"
    puts       "------ The entire provider authentication return ------\n\n"
    puts request.env['omniauth.auth']
    puts     "\n-------------------------------------------------------\n\n\n"
    @user = User.from_omniauth(request.env["omniauth.auth"])
    puts "\n\n\n-------------------------------------------------------\n\n"
    puts       "------ The entire provider authentication return ------\n\n"
    puts @user.provider
    puts @user.uid
    puts @user.password
    puts @user.name
    puts @user.email
    puts @user.photo
    puts request.env['omniauth.auth'].info.image
    session[:myphoto] = request.env['omniauth.auth'].info.image
    puts @user.persisted?
    puts @user.save
    puts @user.persisted? || @user.save
    puts     "\n-------------------------------------------------------\n\n\n"

    if @user.persisted? || @user.save
      sign_in_and_redirect @user #this will throw if @user is not activated
      # sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
    else
      # session["devise.google_oauth2_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end



  # def createWithOmniauth
  #   auth =  request.env['omniauth.auth']
  #   puts "\n\n\n-------------------------------------------------------\n\n"
  #   puts       "------ The entire provider authentication return ------\n\n"
  #   puts auth
  #   puts     "\n-------------------------------------------------------\n\n\n"
  #   # session[:omniauth] = auth.except('extra')
  #   # session[:omniauthExtra] = auth['extra']
  #   user = User.sign_in_from_omniauth(auth)
  #   if user.save
  #     puts "user is save"
  #     sign_in_and_redirect(:user, user)
  #   end
  #   # session[:user_id] = user.id
  #   # redirect_to profile_path
  # end
end
