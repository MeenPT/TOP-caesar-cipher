def is_alphabet?(character)
  return character.downcase.ord.between?('a'.ord, 'z'.ord)
end

def encode_character(char, shift_factor = 1)
  return char if !is_alphabet?(char)

  ord = char.downcase.ord
  a_ord = 'a'.ord
  z_ord = 'z'.ord

  if (ord + shift_factor).between?(a_ord, z_ord)
    return (ord + shift_factor).chr
  end

  new_ord = ((ord + shift_factor) % z_ord) + (a_ord - 1)

  return new_ord.chr
end

def caesar_cipher(message = '', shift_factor = 1)
  ecoded_message = ''

  message.each_char do |char|
    is_upcase = char == char.upcase

    encoded_char = is_upcase ? encode_character(char, shift_factor).upcase : encode_character(char, shift_factor)

    ecoded_message = ecoded_message + encoded_char
  end

  return ecoded_message
end

puts caesar_cipher("What a string!", 5)