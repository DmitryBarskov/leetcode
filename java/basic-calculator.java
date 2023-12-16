// @leetup=custom
// @leetup=info id=224 lang=java slug=basic-calculator

/*
 * Given a string `s` representing a valid expression, implement a basic calculator
 * to evaluate it, and return *the result of the evaluation*.
 *
 * Note: You are not allowed to use any built-in function which evaluates
 * strings as mathematical expressions, such as `eval()`.
 *
 *
 * Example 1:
 *
 * Input: s = "1 + 1"
 * Output: 2
 *
 * Example 2:
 *
 * Input: s = " 2-1 + 2 "
 * Output: 3
 *
 * Example 3:
 *
 * Input: s = "(1+(4+5+2)-3)+(6+8)"
 * Output: 23
 *
 *
 * Constraints:
 *
 * * `1 <= s.length <= 3 * 105`
 * * `s` consists of digits, `'+'`, `'-'`, `'('`, `')'`, and `' '`.
 * * `s` represents a valid expression.
 * * `'+'` is not used as a unary operation (i.e., `"+1"` and `"+(2 + 3)"` is
 *   invalid).
 * * `'-'` could be used as a unary operation (i.e., `"-1"` and `"-(2 + 3)"` is
 *   valid).
 * * There will be no two consecutive operators in the input.
 * * Every number and running calculation will fit in a signed 32-bit integer.
 *
 */
import java.util.*;
import java.util.stream.*;

// @leetup=custom
// @leetup=code

interface Expression {
    int intValue();
}

class ExpressionBuilder {
    private final List<String> tokens;

    public ExpressionBuilder(List<String> tokens) {
        this.tokens = tokens;
    }

    public Expression buildExpression() {
        while (true) {
            var token = ...;
            if (token.equals("-")) {

            } else if (token.equals("+")) {

            } else if (token.equals("(")) {

            } else if (token.equals(")")) {

            } else { // a number
                new JustNumber(token);
            }
        }
    }
}

class JustNumber implements Expression {
    private final int value;

    public JustNumber(String str) {
        this(Integer.valueOf(str));
    }

    public JustNumber(int value) {
        this.value = value;
    }

    @Override
    public int intValue() {
        return value;
    }
}

class ArithmeticExpression implements Expression {
    private final String operation;
    private final List<Expression> arguments;

    public ArithmeticExpression(String operation, List<Expression> arguments) {
        this.operation = operation;
        this.arguments = arguments;
    }

    @Override
    public int intValue() {
        return 0;
    }

    @Override
    public String toString() {
        return String.format(
            "(%s %s)",
            operation,
            arguments.stream().map(Expression::toString).toList()
        );
    }
}

class Tokens {
    private final List<String> tokens;

    private Tokens(String[] tokens) {
        this.tokens = Stream.of(tokens).filter(t -> !t.isBlank()).toList();
    }

    public Tokens(String tokens) {
        this(tokens.split("\\s+|(?=\\()|(?<=\\))|\\b"));
    }

    public List<String> toList() {
        return tokens;
    }
}

class Solution {

    public static int calculate(String s) {
        // \\s+|(?=\\()|(?<=\\))|\\b
    }
}
// @leetup=code
// TODO:
