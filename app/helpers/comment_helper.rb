module CommentHelper

	#constantes de variações de vogais
	A_CONST = ["á", "à", "ä", "ã", "â", "@", "4"]
	E_CONST = ["é", "è", "ë", "ẽ", "ê" "3"]
	I_CONST = ["í", "ì", "ï", "ĩ", "î"]
	O_CONST = ["ó", "ò", "ö", "õ", "ô", "0"]
	U_CONST = ["ú", "ù", "ü", "ũ", "û"]

	def self.validate_message(message, black_list)
		final_string = String.new
		message_list = String.new(message).split(" ");		

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

	def self.similar_words(blocked_word)
		words = Array.new

		if blocked_word.include? "a"
			A_CONST.each do |char|
				words.push(String.new(blocked_word).sub "a", char);
				words.push(String.new(blocked_word).gsub! "a", char);
			end
		end
		
		if blocked_word.include? "e"
			E_CONST.each do |char|
				words.push(String.new(blocked_word).sub "e", char);
				words.push(String.new(blocked_word).gsub! "e", char);
			end
		end	

		if blocked_word.include? "i"
			I_CONST.each do |char|
				words.push(String.new(blocked_word).sub "i", char);
				words.push(String.new(blocked_word).gsub! "i", char);
			end
		end

		if blocked_word.include? "o"
			O_CONST.each do |char|
				words.push(String.new(blocked_word).sub "o", char);
				words.push(String.new(blocked_word).gsub! "o", char);
			end
		end	

		if blocked_word.include? "u"
			U_CONST.each do |char|
				words.push(String.new(blocked_word).sub "u", char);
				words.push(String.new(blocked_word).gsub! "u", char);
			end
		end	

		return words
	end

end
