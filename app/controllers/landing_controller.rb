class LandingController < ApplicationController

  def index
  end

  def cadastro
    puts 'teste'
    
    begin
      vnome = params.require(:nome)
      vsobrenome = params.require(:sobrenome)
      vemail = params.require(:email)
      @cadastro = Cadastro.create(nome: vnome , sobrenome: vsobrenome, email: vemail)
      if @cadastro.save
        @message = "E-mail cadastrado com sucesso!"
        @notify_flag = "success"
        
        @list_id = MAILCHIMPLISTID
        gb = Gibbon::Request.new(api_key: MAILCHIMPAPIKEY)

        gb.lists(@list_id).members.create(body: {
            email_address: vemail, 
            status: "pending", 
            merge_fields: {FNAME: vnome, LNAME: vsobrenome}, 
            double_optin: false, 
            update_existing: true, 
            send_welcome: true})
      else
        @message = "E-mail inválido ou já cadastrado!"
        
        @notify_flag = "error"
      end
    rescue
      @message = "E-mail inválido ou já cadastro"
      @notify_flag = "error"
    end

    respond_to do |format|
      format.js
    end

  end

end
