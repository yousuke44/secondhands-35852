class Department < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '法学部' },
    { id: 3, name: '商学部' },
    { id: 4, name: '政治経済学部' },
    { id: 5, name: '文学部' },
    { id: 6, name: '理工学部' },
    { id: 7, name: '農学部' },
    { id: 8, name: '経営学部' },
    { id: 9, name: '情報コミュニケーション学部' },
    { id: 10, name: '国際日本学部' },
    { id: 11, name: '総合数理学部' },
  ]

  include ActiveHash::Associations
  has_many :users
end