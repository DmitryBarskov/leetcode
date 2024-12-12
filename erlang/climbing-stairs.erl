% Time complexity O(N), space complexity O(1)
-spec climb_stairs(N :: integer()) -> integer().
climb_stairs(N) -> climb_stairs(N, 0, 1).
climb_stairs(0, A, B) -> B;
climb_stairs(N, A, B) -> climb_stairs(N - 1, B, A + B).
