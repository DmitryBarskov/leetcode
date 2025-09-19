class Spreadsheet:
    def __init__(self, rows: int):
        self.cells = {}

    def setCell(self, cell: str, value: int) -> None:
        self.cells[cell] = value

    def resetCell(self, cell: str) -> None:
        if cell in self.cells:
            self.cells.pop(cell)

    def getValue(self, formula: str) -> int:
        left, right = formula.lstrip('=').split('+')
        left = self.eval(left)
        right = self.eval(right)
        return left + right

    def eval(self, expression: str) -> int:
        if expression.isnumeric():
            return int(expression)
        else:
            return self.cells.get(expression, 0)
