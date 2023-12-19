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
import java.util.function.*;
import java.util.stream.*;

// @leetup=custom
// @leetup=code

public class Main {
    public static void main(String[] args) {
        System.out.println(new ExpressionBuilder(new Tokens("(1+(4+5+2)-3)+(6+8)").toList()).build());
    }
}

interface Expression {
    int intValue();

    class Builder implements Expression {
        private Builder parent;
        private String operation = "";
        private ArrayList<Expression> arguments = new ArrayList<>();

        public Builder(Builder parent) {
            this.parent = parent;
        }
        public Builder() {}

        public void withOperation(String operation) {
            this.operation = operation;
        }
        public void addArgument(Expression arg) {
            this.arguments.add(arg);
        }
        public Builder parent() {
            return parent;
        }
        public Expression toExpression() {
            if (operation.equals("")) {
                if (arguments.size() == 0) {
                    return new JustNumber(0);
                }
                return new JustNumber(arguments.get(0).intValue());
            }
            return new ArithmeticExpression(operation, arguments);
        }

        @Override
        public int intValue() {
            return toExpression().intValue();
        }
    }
}

class ExpressionBuilder {
    private final List<String> tokens;

    public ExpressionBuilder(List<String> tokens) {
        this.tokens = new ArrayList<>(tokens);
    }

    public Expression build() {
        // "(1+(4+5+2)-3)+(6+8)"
        //        +
        //      /   \
        //     -     +
        //    / \   / \
        //   +   3 6   8
        //  / \
        // 1   +
        //    /|\
        //   4 5 2
        Expression.Builder root = new Expression.Builder();
        root.withOperation("+");
        root.addArgument(new JustNumber(0));
        Expression.Builder currentNode = root;
        for (var token : tokens) {
            if (token.equals("-") || token.equals("+")) {
                var parent = currentNode;
                currentNode = new Expression.Builder(currentNode);
                currentNode.withOperation(token);
                currentNode.addArgument(parent);
            } else if (token.equals("(")) {
                var parent = currentNode;
                currentNode = new Expression.Builder(currentNode);
                currentNode.addArgument(parent);
            } else if (token.equals(")")) {
                currentNode = currentNode.parent();
            } else {
                currentNode.addArgument(new JustNumber(token));
            }
        }
        return root.toExpression();
    }
}

class JustNumber implements Expression {
    private final int value;

    public JustNumber(String str) {
        this(Integer.parseInt(str));
    }

    public JustNumber(int value) {
        this.value = value;
    }

    @Override
    public int intValue() {
        return value;
    }

    public String toString() {
        return String.valueOf(value);
    }
}

class ArithmeticExpression implements Expression {
    private final static Map<String, Function<List<Expression>, Integer>> SUPPORTED_OPERATIONS = Map.of(
            "-", arguments -> {
                if (arguments.size() == 1) {
                    return -arguments.get(0).intValue();
                }
                return arguments.stream().mapToInt(Expression::intValue).reduce((a, b) -> a - b).orElse(0);
            },
        "+", (List<Expression> arguments) -> arguments.stream().mapToInt(Expression::intValue).sum()
    );
    private final String operation;
    private final ArrayList<Expression> arguments;

    public ArithmeticExpression(String operation, List<Expression> arguments) {
        this.operation = operation;
        this.arguments = new ArrayList<>(arguments);
    }

    @Override
    public int intValue() {
        return SUPPORTED_OPERATIONS.get(operation).apply(arguments);
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
        return 0;
    }
}
// @leetup=code
// TODO:
