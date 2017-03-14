# frozen_string_literal: true
def calc(expr)
  return 0 if expr.length.zero?
  stack = []
  until expr.empty?
    case expr
    when /\A-?\d+(\.\d+)?/
      stack.push($&.to_f)
    when /\S*/
      second_operand = stack.pop
      first_operand = stack.pop

      stack.push(first_operand.send($&, second_operand))
    end

    expr = $'
    expr.lstrip!
  end

  stack.pop
end
