module Selections
  SELECTIONS = [
      {
        name: 'One Cup',
        amount: 500,
        image: 'cup_of_coffee.jpg',
      },
      {
        name: 'A Fancy Latte',
        amount: 700,
        image: 'latte.jpg',
      },
      {
        name: 'Lattes For Two',
        amount: 1400,
        image: 'latte_for_two.jpg',
      },
      {
        name: 'Burger and Beer',
        amount: 2000,
        image: 'burger_and_beer.jpg',
      },
      {
        name: 'Round of Drinks',
        amount: 4000,
        image: 'round_of_drinks.jpg',
      },
      {
        name: 'Dinner Out',
        amount: 8000,
        image: 'dinner_out.jpg',
      },
    ].freeze

  def self.all
    SELECTIONS.map do |attrs|
      Selection.new(attrs)
    end
  end

  class Selection
    def initialize(attrs)
      @attrs = attrs
    end

    [:name, :amount, :image].each do |attr|
      define_method(attr) do
        @attrs[attr]
      end
    end
  end
end