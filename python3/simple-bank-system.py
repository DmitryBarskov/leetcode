class Bank:
    """
    >>> bank = Bank([10, 100, 20, 50, 30])
    >>> bank.withdraw(3, 10)
    True
    >>> bank.transfer(5, 1, 20)
    True
    >>> bank.deposit(5, 20)
    True
    >>> bank.transfer(3, 4, 15)
    False
    >>> bank.withdraw(10, 50)
    False
    """

    def __init__(self, balance: list[int]):
        self._balance = balance

    def transfer(self, sender: int, recipient: int, money: int) -> bool:
        if not self.is_valid_account_number(recipient):
            return False

        withdrawed = self.withdraw(sender, money)
        if not withdrawed:
            return False
        self.deposit(recipient, money)
        return True

    def deposit(self, account: int, money: int) -> bool:
        if not self.is_valid_account_number(account):
            return False

        self.update_and_get(account, lambda b: b + money)
        return True

    def withdraw(self, account: int, money: int) -> bool:
        if not self.is_valid_account_number(account):
            return False
        if self.update_and_get(account) < money:
            return False

        self.update_and_get(account, lambda b: b - money)
        return True

    def is_valid_account_number(self, account: int) -> bool:
        return 1 <= account <= len(self._balance)

    def update_and_get(self, account: int, fn = lambda x: x) -> int:
        if not self.is_valid_account_number(account):
            return -1
        self._balance[account - 1] = fn(self._balance[account - 1])
        return self._balance[account - 1]
