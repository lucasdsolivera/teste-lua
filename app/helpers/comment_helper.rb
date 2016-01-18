module CommentHelper

	def self.validate_message(message, black_list)
		final_string = String.new
		message_list = String.new(message).split(" ");		

		if(black_list.nil? || black_list.empty?)
			return message
		end

		r = /#{black_list.map(&:upcase).map{|w|Regexp.escape(w)}.join('|')}/
		message_list.each do |word|
			if r.match(word.upcase) != nil
				replace_word = String.new
				word.size.times{replace_word << "#"}

				word = replace_word
			end
			final_string = final_string + word  + " "
		end	

		return final_string.chomp(" ")
	end

end
