  def check_digits(string)
    scan = string.scan(/\D/)
    scan.size == 0 || (scan.size == 1 && scan.first == ".")
  end

  def multiple(element, by_value)
    element * by_value
  end

  def calculate(value, isbn)
    sum_with_multiple = isbn.length % 2 == 0 ? multiple(value, 1) : multiple(value, 3)
    isbn.slice!(0)
    sum_with_multiple
  end

  def complete_isbn(isbn)
    return "0" unless check_digits(isbn)
    sum = 0
    isbn.each_char {|ele| sum += calculate(ele.to_i, isbn)}
    sum_with_mod = sum % 10
    final = 10 - sum_with_mod
    final == 10 ? 0.to_s : final.to_s
  end

  if ARGV[0]&.length == 12 && ARGV[0]&.delete("^0-9")
    puts 'The isbn completed is: ' + ARGV[0] + complete_isbn(ARGV[0].dup)
  else
    puts 'The isbn entered is wrong.'
  end
