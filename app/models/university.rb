class University < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '明治大学' },
    { id: 3, name: '青山学院大学' },
    { id: 4, name: '立教大学' },
    { id: 5, name: '中央大学' },
    { id: 6, name: '法政大学' },
  ]

  include ActiveHash::Associations
  has_many :users
end