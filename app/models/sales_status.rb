class SalesStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '---------' },
    { id: 2, name: '未使用に近い' },
    { id: 3, name: 'マーカーや書き込みあり' },
    { id: 4, name: '全体的に状態が悪い' },
  ]

  include ActiveHash::Associations
  has_many :items
end