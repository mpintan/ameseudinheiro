# Preview all emails at http://localhost:3000/rails/mailers/cadastro_mailer
class CadastroMailerPreview < ActionMailer::Preview

  def welcome_email
    CadastroMailer.welcome_email(Cadastro.first)
  end

end
