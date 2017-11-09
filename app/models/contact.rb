class Contact < ApplicationRecord
  def self.create(args)
    new(args)
  end
  def self.searchById(contactId)
    find(contactId)
  end
  def self.searchByWhere(args)
    where(args)
  end
end
