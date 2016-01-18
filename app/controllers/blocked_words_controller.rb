class BlockedWordsController < ApplicationController

	include BlockedWordsHelper

	skip_before_action :verify_authenticity_token  

	def index
		@blocked_list = BlockedWord.pluck(:word)
	end

	def create
		@blocked_word = BlockedWord.create(word: params[:word])

		blocked_word_similars = BlockedWordsHelper.similar_words(params[:word])
		blocked_word_similars.each do |item|
			BlockedWord.create(word: item)
		end

		redirect_to "/blocked_words"
	end

end
