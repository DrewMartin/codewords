class Card < ApplicationRecord
	belongs_to :game
	enum owner: [ :red, :blue, :neutral, :trap ]
end
