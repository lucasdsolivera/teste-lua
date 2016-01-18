module BlockedWordsHelper
	#constantes de variações de vogais
	A_CONST = ["á", "à", "ä", "ã", "â", "@", "4"]
	E_CONST = ["é", "è", "ë", "ẽ", "ê" "3"]
	I_CONST = ["í", "ì", "ï", "ĩ", "î"]
	O_CONST = ["ó", "ò", "ö", "õ", "ô", "0"]
	U_CONST = ["ú", "ù", "ü", "ũ", "û"]

	def self.similar_words(blocked_word)
		words = Array.new

		if blocked_word.include? "a"
			A_CONST.each do |char|
				words.push(String.new(blocked_word).sub "a", char);
			end
		end
		
		if blocked_word.include? "e"
			E_CONST.each do |char|
				words.push(String.new(blocked_word).sub "e", char);
			end
		end	

		if blocked_word.include? "i"
			I_CONST.each do |char|
				words.push(String.new(blocked_word).sub "i", char);
			end
		end

		if blocked_word.include? "o"
			O_CONST.each do |char|
				words.push(String.new(blocked_word).sub "o", char);
			end
		end	

		if blocked_word.include? "u"
			U_CONST.each do |char|
				words.push(String.new(blocked_word).sub "u", char);
			end
		end	

		return words
	end
	
end
