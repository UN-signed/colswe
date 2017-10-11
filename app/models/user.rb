# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  description            :text
#  degree                 :text
#  github_username        :string
#  departament            :string
#  research_group_id      :integer
#

class User < ApplicationRecord
  has_many :articles
  has_many :members
  belongs_to :research_group

  mount_uploader :photo, PhotoUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, :omniauth_providers => [:facebook, :github, :google_oauth2]

	protected
	def confirmation_required?
	  false
	end
<<<<<<< HEAD
=======

  def self.from_omniauth(auth)
    puts "in self.from_omniauth"
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.photo = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
  def self.old_user_from_omniauth(auth)
    find_by(email: auth.info.email).provider
  end
  has_many :articles
  has_many :members
  # belongs_to :research_group

  mount_uploader :photo, PhotoUploader
>>>>>>> 8ca2672343c6ad82d7d9a283715d4c1a10297b4c

end
