# @param {String} expression
# @return {String}
def fraction_addition(expression)
  expression.split(/(?=[+-])/).reduce([0, 1]) do |acc, fr|
    numerator, denominator = fr.split("/").map(&:to_i)
    res_numerator = acc[0] * denominator + numerator * acc[1]
    res_denominator = acc[1] * denominator
    gcd = res_numerator.gcd(res_denominator)
    [res_numerator / gcd, res_denominator / gcd]
  end.join("/")
end
