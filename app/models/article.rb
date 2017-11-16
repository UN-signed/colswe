# == Schema Information
#
# Table name: articles
#
#  id           :integer          not null, primary key
#  name         :string
#  key_words    :text
#  description  :text
#  language     :string
#  bibliography :text
#  file_path    :string
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Article < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :id, uniqueness: true
  validates :name, :key_words, :language, :user_id, presence: true  

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
