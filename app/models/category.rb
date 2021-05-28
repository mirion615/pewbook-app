class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'HTML' },
    { id: 3, name: 'CSS' },
    { id: 4, name: 'Java Script' },
    { id: 5, name: 'Ruby' },
    { id: 6, name: 'Vue.js' },
  ]

  include ActiveHash::Associations
  has_many :quizzes
  end