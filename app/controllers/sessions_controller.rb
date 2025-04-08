class SessionsController < ApplicationController
  def new
    # Esta acción muestra el formulario de inicio de sesión
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id  # Guardamos el ID del usuario en la sesión
      redirect_to root_path, notice: "¡Bienvenido, #{user.email}!"
    else
      flash.now[:alert] = "Correo electrónico o contraseña inválidos"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil  # O el nombre de la variable que usas para gestionar la sesión
    redirect_to root_path, notice: 'Has cerrado sesión correctamente.'
  end
end
