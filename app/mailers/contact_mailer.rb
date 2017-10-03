class ContactMailer < ApplicationMailer
	default from: "smarthubcolswe@gmail.com"

	def contact_email(contact)
    @contact = contact
    mail(to: @contact.email, subject: 'Nuevo Contacto')
  end
end
