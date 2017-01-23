class CadastroMailer < ApplicationMailer
    
  default from: 'mpintan@gmail.com'
 
  def welcome_email(usuario)
    @user = usuario
    @url  = 'http://ameseudinheiro.com.br'
    mail(to: @user.email, subject: 'AmeSeuDinheiro - Primeiro passo para o sucesso!')
  end
    
    
end
