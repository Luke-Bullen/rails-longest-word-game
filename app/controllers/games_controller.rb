require "open-uri"

class GamesController < ApplicationController


  def new
    vowel = ["A", "E", "I", "O", "U"]
    @letters = []
    7.times do
      letter = ('A'..'Z').to_a
      @letters << letter.sample
    end
    3.times do
      @letters << vowel.sample
    end
    @letters
  end

  def score
    @letters = params[:letters].split
    @input = (params[:input] || "").upcase
    @included = included?(@input, @letters)
    @english_word = english_word?(@input)
  end

  private

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
