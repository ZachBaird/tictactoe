# Tictactoe

A simple Ruby tictactoe game.

## Getting Started

1. Clone the repository
2. `cd` into `tictactoe`
3. Run `bundle install`
4. Run `rspec` to run the unit tests
5. Run `ruby lib/main.rb` to play the game!

## The Files

There are 5 files inside the `old/lib` folder which constituted the original approach:

* board.rb - static class for printing out the board
* gamestate.rb - holds the GameState class, which contains the game's state and APIs to mutate the data
* gamemanager.rb - primary class of the application, containing logic that I should break up a bit more and a GameState object
* referee.rb - class for determining if there's a winner
* tictactoe.rb - the entrypoint for the application

The current test-driven version also has 5 files:

* board.rb - A class containing a strin literal of what the board looks like with methods to display and update that value
* gamemanager.rb - A class managing the main game loop and consuming most the other code
* main.rb - The entrypoint for the application
* move.rb - A class serving as a plain old Ruby object to store player data on a move
* referee.rb - A class who's primary purpose is to store the move data and determine a winner when necessary
