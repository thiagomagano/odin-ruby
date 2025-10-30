# Caesar cipher project for Odin Ruby Course

# Implement a Caesar cipher that takes in a string and the shift factor and
# then outputs the modified string using a right shift:

# > caesar_cipher("What a string!", 5)
#=> "Bmfy f xywnsl!"

# Quick Tips:

# - You will need to remember how to convert a string into a number.
# - Don’t forget to wrap from z to a.
# - Don’t forget to keep the same case.
# - The Wikipedia quote discusses a Caesar cipher using a left shift.

# Define a hash do Alfabeto

def cria_alfabeto
  ('a'..'z').each_with_index.to_h do |letter, index|
    [index, letter]
  end
end

def cria_alfabeto_cesar(step)
  alfabeto = cria_alfabeto

  max_index = alfabeto.size

  alfabeto.map.to_h do |index, letter|

    new_index = index + step

    # Caso o numero z => a.., fazer a volta
    new_index -= max_index if new_index >= max_index

    new_letter = alfabeto[new_index]

    [letter, new_letter]
  end
end

def caesar_cipher(str, step)
  alfabeto_cesar = cria_alfabeto_cesar(step)
  new_str = []
  str.split('').each do |letter|
    if letter.match?(/\A[A-Za-z]\z/) # regex pra verificar se é uma letra
      ceasar_letter = alfabeto_cesar[letter.downcase]  # Aqui faz a tradução da letra e.g: "a" => "f"
      # Em caso de letra maiscula sobe ela novamente
      letter.match?(/[A-Z]/) ? new_str.push(ceasar_letter.upcase) : new_str.push(ceasar_letter)
    else # Caso não seja uma letra comum de A-Z não faz tradução
      new_str.push(letter)
    end
  end
  new_str.join
end

def main
  print 'Qual frase você quer encriptografar? '
  str = gets.chomp
  print 'Com quantos passos para o lado? (Digite um Numero) '
  step = gets.chomp.to_i

  ceasar_str = caesar_cipher(str, step)
  puts 'Aqui está sua frase encriptograda:'
  puts ceasar_str
end

main
