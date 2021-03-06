# == Schema Information
#
# Table name: articles
#
#  id            :integer          not null, primary key
#  name          :string
#  key_words     :text
#  description   :text
#  language      :string
#  bibliography  :text
#  file_path     :string
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  pdf           :string
#  project_id    :integer
#  html          :text
#  url           :string
#  uploader_type :string
#

class Article < ApplicationRecord
  # belongs_to :project
  has_and_belongs_to_many :project
  belongs_to :user

  validates :id, uniqueness: true
  validates :name, :key_words, :language, :user_id, presence: true
  validates :name, format: { with: /\A[a-zA-Z0-9 ]+\z/ }

  mount_uploader :pdf, PdfUploader

  def self.load_articles(**args)
    paginate(page: args[:page] || 1, per_page: 12).reverse_order
  end

  def self.create(args)
    new(args)
  end

  def self.searchById(articleId)
    find(articleId)
  end

  def self.searchByWhere(args)
    where(args)
  end

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
