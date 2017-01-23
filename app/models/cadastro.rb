class Cadastro < ActiveRecord::Base
    
    validates :nome, length: { minimum: 3 }
    validates :sobrenome, length: { minimum: 3 }
    validates :email, length: { minimum: 8 }
    
end
