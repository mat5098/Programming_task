# frozen_string_literal: true

class LoadData
  def initialize
    @numbers = []
  end

  def number1
    @numbers[0]
  end

  def number2
    @numbers[1]
  end

  def number3
    @numbers[2]
  end

  def enter_numbers
    3.times do |iterator|
      begin
        puts "Enter a number #{iterator + 1} of 3"
        n = Integer gets
      rescue StandardError
        puts "It isn't an integer. Program is stop"
        exit
      end
      @numbers << n
    end
  end
end

class NumberChanger
  def initialize(num1, num2, num3)
    @num1 = num1
    @num2 = num2
    @num3 = num3
  end

  def calculate
    arr1 = separate(@num1).reverse!
    arr2 = separate(@num2).reverse!
    arr3 = separate(@num3).reverse!

    num1 = sum(arr1).join.to_i
    num2 = sum(arr2).join.to_i
    num3 = sum(arr3).join.to_i

    arr4 = []
    arr4 << num1
    arr4 << num2
    arr4 << num3
  end

  private

  def separate(number)
    arr = []
    while number.positive?
      digit = number % 10
      arr << digit
      number /= 10
    end
    arr
  end

  def sum(numbers)
    num = numbers.sum
    numbers.each_with_index do |_val, index|
      case num % 3
      when 2
        if numbers[index] < 9
          numbers[index] += 1
          return numbers
        else
          while numbers[index] >= 9
            index += 1
            if numbers[index] < 9
              numbers[index] += 1
              return numbers
            end
          end
        end

      when 1
        if numbers[index] <= 7
          numbers[index] += 2
          return numbers
        elsif numbers[index] == 8
          numbers[index] += 1
          if numbers[index] < 9
            numbers[index] += 1
            return numbers
            numbers[index] += 1
            return numbers
          else
            while numbers[index] >= 9
              index += 1
              if numbers[index] < 9
                numbers[index] += 1
                return numbers
              end
            end
          end

        end

      end
    end
  end
end

# [784, 4765, 5291]
loader = LoadData.new
loader.enter_numbers

changer = NumberChanger.new(loader.number1, loader.number2, loader.number3)
print changer.calculate
