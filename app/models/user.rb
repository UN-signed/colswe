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
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

	protected
	def confirmation_required?
	  false
	end
  has_many :articles
  has_many :members
  # belongs_to :research_group

  has_attached_file :image, styles: { medium: "1280x720", thumb: "800x600" }
  has_attached_file :photo, styles: { medium: "1280x720", thumb: "800x600" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
