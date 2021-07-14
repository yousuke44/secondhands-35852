class YearPeriod < ActiveHash::Base
  self.data = [
    { id: 1, name: '---------' },
    { id: 2, name: '2021年度/前期' },
    { id: 3, name: '2021年度/後期' },
    { id: 4, name: '2022年度/前期' },
    { id: 5, name: '2022年度/後期' },
    { id: 6, name: '2023年度/前期' },
    { id: 7, name: '2023年度/後期' },
    { id: 8, name: '2024年度/前期' },
    { id: 9, name: '2024年度/後期' },
    { id: 10, name: '2025年度/前期' },
    { id: 11, name: '2025年度/後期' },
  ]

  include ActiveHash::Associations
  has_many :items
end