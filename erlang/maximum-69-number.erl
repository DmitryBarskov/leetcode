-spec maximum69_number (Num :: integer()) -> integer().
maximum69_number (Num) -> maximum69_number(Num, Num, Num, 1).

maximum69_number (MaxNum, Num, 0, Power) -> MaxNum;
maximum69_number (MaxNum, Num, Digits, Power) when Digits rem 10 == 6 ->
    maximum69_number(max(MaxNum, Num + 3 * Power), Num, Digits div 10, Power * 10);
maximum69_number (MaxNum, Num, Digits, Power) ->
    maximum69_number(MaxNum, Num, Digits div 10, Power * 10).
