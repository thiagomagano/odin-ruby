require 'minitest/autorun'

require_relative "caesar_cipher"

class ChallengeTest < Minitest::Test
  def test_it_should_create_alphabet
    want = {
      0 => "a",
      1 => "b",
      2 => "c",
      3 => "d",
      4 => "e",
      5 => "f",
      6 => "g",
      7 => "h",
      8 => "i",
      9 => "j",
      10 => "k",
      11 => "l",
      12 => "m",
      13 => "n",
      14 => "o",
      15 => "p",
      16 => "q",
      17 => "r",
      18 => "s",
      19 => "t",
      20 => "u",
      21 => "v",
      22 => "w",
      23 => "x",
      24 => "y",
      25 => "z",
    } # Valor esperado
    got = cria_alfabeto() # Chamada pra função
    assert_equal want, got
  end

  def test_it_should_create_cesar_alphabet
    want = {
      "a" => "f",
      "b" => "g",
      "c" => "h",
      "d" => "i",
      "e" => "j",
      "f" => "k",
      "g" => "l",
      "h" => "m",
      "i" => "n",
      "j" => "o",
      "k" => "p",
      "l" => "q",
      "m" => "r",
      "n" => "s",
      "o" => "t",
      "p" => "u",
      "q" => "v",
      "r" => "w",
      "s" => "x",
      "t" => "y",
      "u" => "z",
      "v" => "a",
      "w" => "b",
      "x" => "c",
      "y" => "d",
      "z" => "e"
    } # Valor esperado
    got = cria_alfabeto_cesar(5) # Chamada pra função
    assert_equal want, got
  end

  def test_it_should_translate_string_to_ceasar_alphabet
    want = "Bmfy f xywnsl!" # Valor esperado
    got = ceasar_cipher("What a string!", 5) # Chamada pra função
    assert_equal want, got
  end
end
