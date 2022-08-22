require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      letter = ('A'..'Z').to_a
      @letters << letter.sample
    end
    @letters
  end

  def score
    # raise
    @url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
  end
end
