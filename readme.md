# Oreo Tictactoe

This repository is a simple Ruby tictactoe game.

## Getting Started

All you need is Ruby installed on your machine. I wrote this in Ruby 2.6.5.

## The Files

There are 5 files inside the `dist` folder:

* board.rb - static class for printing out the board
* gamestate.rb - holds the GameState class, which contains the game's state and APIs to mutate the data
* gamemanager.rb - primary class of the application, containing logic that I should break up a bit more and a GameState object
* referee.rb - class for determining if there's a winner
* tictactoe.rb - the entrypoint for the application

## Playing

To play the game, simply clone the repo, `cd` into `TicTacToe/dist`, and then run `ruby tictactoe.rb`.