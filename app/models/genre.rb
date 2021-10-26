class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '食べ物' },
    { id: 3, name: '飲み物' },
    { id: 4, name: 'おもちゃ' },
    { id: 5, name: 'レア' },
    { id: 6, name: 'おもしろ' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :venders
  end