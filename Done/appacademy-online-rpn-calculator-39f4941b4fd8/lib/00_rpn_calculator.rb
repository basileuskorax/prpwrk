class RPNCalculator
  OPERATORS = [:+, :-, :*, :/]

  def initialize
    @stack = []
  end

  def push(num)
    @stack << num
  end

  def plus
    perform_operation(:+)
  end

  def minus
    perform_operation(:-)
  end

  def divide
    perform_operation(:/)
  end

  def times
    perform_operation(:*)
  end

  def value
    @stack[-1]
  end

  def tokens(string)
    string.split.map{|char| operator?(char) ? char.to_sym : char.to_i}
  end

  def evaluate(input)
    tokens(input).each do |token|
      case token
      when Integer
        push(token)
      else
        perform_operation(token)
      end
    end

    value
  end

  private
  def perform_operation(operation)
    raise "calculator is empty" unless @stack.length >= 2

    operand2 = @stack.pop
    operand1 = @stack.pop

  case operation
    when :+
      @stack << operand1 + operand2
    when :-
      @stack << operand1 - operand2
    when :*
      @stack << operand1 * operand2
    when :/
      @stack << operand1.to_f / operand2
    else
      @stack << operand1 << operand2
    end
  end

  def operator?(char)
    OPERATORS.include?(char.to_sym)
  end

end
