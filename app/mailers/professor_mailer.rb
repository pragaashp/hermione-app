class ProfessorMailer < ApplicationMailer
    default from: "yc.lu95@gmail.com"
    
    def email(email_address)
        mail(to:email_address, subject: 'test')
    end
end
