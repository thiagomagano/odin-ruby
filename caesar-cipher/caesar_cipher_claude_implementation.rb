# An implementation of LLM to compare with my code.
# Model: Haiku 4.5
# Prompt: Implement a Caesar Cipher in ruby.
class CaesarCipher
  def initialize(shift = 3)
    @shift = shift
  end

  def encrypt(text)
    transform(text, @shift)
  end

  def decrypt(text)
    transform(text, -@shift)
  end

  private

  def transform(text, shift)
    text.chars.map do |char|
      if char.match?(/[a-z]/)
        # Lowercase letters
        ((char.ord - 'a'.ord + shift) % 26 + 'a'.ord).chr
      elsif char.match?(/[A-Z]/)
        # Uppercase letters
        ((char.ord - 'A'.ord + shift) % 26 + 'A'.ord).chr
      else
        # Non-alphabetic characters remain unchanged
        char
      end
    end.join
  end
end

# Example usage
cipher = CaesarCipher.new(3)

encrypted = cipher.encrypt("Hello, World!")
puts "Encrypted: #{encrypted}"  # Output: Khoor, Zruog!

decrypted = cipher.decrypt(encrypted)
puts "Decrypted: #{decrypted}"  # Output: Hello, World!

# Try with different shift value
cipher2 = CaesarCipher.new(5)
puts "\nWith shift of 5:"
puts "Encrypted: #{cipher2.encrypt("Ruby")}"  # Output: Wdcn
puts "Decrypted: #{cipher2.decrypt("Wdcn")}"  # Output: Ruby
