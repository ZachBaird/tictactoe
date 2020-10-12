# frozen_string_literal: true

require_relative 'gamemanager'

game = GameManager.new
choice = gets.chomp
choice.capitalize!

game.play if ['Y', 'Yes'].include? choice
