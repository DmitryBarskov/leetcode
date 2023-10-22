/*
Zuma Game
https://leetcode.com/problems/zuma-game/

You are playing a variation of the game Zuma.
In this variation of Zuma, there is a single row of colored balls on a board, where each ball can be colored red 'R', yellow 'Y', blue 'B', green 'G', or white 'W'. You also have several colored balls in your hand.

Your goal is to clear all of the balls from the board. On each turn:
- Pick any ball from your hand and insert it in between two balls in the row or on either end of the row.
- If there is a group of three or more consecutive balls of the same color, remove the group of balls from the board.
- If this removal causes more groups of three or more of the same color to form, then continue removing each group until there are none left.
- If there are no more balls on the board, then you win the game.
- Repeat this process until you either win or do not have any more balls in your hand.

Given a string board, representing the row of balls on the board, and a string hand, representing the balls in your hand, return the minimum number of balls you have to insert to clear all the balls from the board. If you cannot clear all the balls from the board using the balls in your hand, return -1.

Example 1:
  Input: board = "WRRBBW", hand = "RB"
  Output: -1
  Explanation: It is impossible to clear all the balls. The best you can do is:
  - Insert 'R' so the board becomes WRRRBBW. WRRRBBW -> WBBW.
  - Insert 'B' so the board becomes WBBBW. WBBBW -> WW.
  There are still balls remaining on the board, and you are out of balls to insert.

Example 2:
  Input: board = "WWRRBBWW", hand = "WRBRW"
  Output: 2
  Explanation: To make the board empty:
  - Insert 'R' so the board becomes WWRRRBBWW. WWRRRBBWW -> WWBBWW.
  - Insert 'B' so the board becomes WWBBBWW. WWBBBWW -> WWWW -> empty.
  2 balls from your hand were needed to clear the board.

Example 3:
  Input: board = "G", hand = "GGGGG"
  Output: 2
  Explanation: To make the board empty:
  - Insert 'G' so the board becomes GG.
  - Insert 'G' so the board becomes GGG. GGG -> empty.
  2 balls from your hand were needed to clear the board.

Constraints:
- 1 <= board.length <= 16
- 1 <= hand.length <= 5
- board and hand consist of the characters 'R', 'Y', 'B', 'G', and 'W'.
- The initial row of balls on the board will not have any groups of three or more consecutive balls of the same color.

#string #dynamicprogramming #stack #breadthfirstsearch #memoization
*/

// TODO: fix TLE
/**
 * @param {array} row - row of balls
 * @param {number} insertIndex - where the last ball was inserted
 * @returns {array}
 */
function reduceBalls(row, insertIndex) {
  function findCluster(currentRow, startIndex) {
    let leftBound = startIndex;
    while (leftBound > 0 && currentRow[leftBound - 1] === currentRow[startIndex]) {
      leftBound--;
    }

    let righBound = startIndex;
    while (righBound < currentRow.length && currentRow[righBound] === currentRow[startIndex]) {
      righBound++;
    }
    return [leftBound, righBound];
  }

  function reduceCluster(currentRow, [clusterStart, clusterEnd]) {
    let clusterSize = clusterEnd - clusterStart;
    if (clusterSize < 3) {
      return currentRow;
    }

    return currentRow.slice(0, clusterStart).concat(currentRow.slice(clusterEnd));
  }

  let previousState = row;
  let clusterStart = insertIndex;
  let currentState = null;
  while (true) {
    let cluster = findCluster(previousState, clusterStart);
    currentState = reduceCluster(previousState, cluster);

    if (currentState.length === previousState.length) {
      break;
    }

    [clusterStart] = cluster;
    previousState = currentState;
  }

  return currentState;
}

const countBalls = (hand) => {
  let occurrences = {};
  for (let i = 0; i < hand.length; i++) {
    occurrences[hand[i]] ??= 0;
    occurrences[hand[i]] += 1;
  }
  return occurrences;
}

function queueOffer(queue, obj) {
  queue.last.val = obj;
  queue.last.next = { next: null };
  queue.last = queue.last.next;
}

function queueEmpty(queue) {
  return queue.first.next === queue.last;
}

function queuePoll(queue) {
  if (queueEmpty(queue)) {
    return null;
  }
  let item = queue.first.next;
  queue.first.next = item.next;
  return item.val;
}

function createQueue(...objs) {
  let queue = { last: { next: null } };
  queue.first = { next: queue.last };
  objs.forEach(obj => queueOffer(queue, obj));
  return queue;
}

function totalBalls(hand) {
  let balls = 0;
  for (let color in hand) {
    balls += hand[color];
  }
  return balls;
}

function missingBalls(board, hand) {
  let boardBalls = countBalls(board);
  for (let color in boardBalls) {
    if (boardBalls[color] + (hand[color] ?? 0) < 3) {
      return true;
    }
  }
  return false;
}

/**
 * @param {string} board
 * @param {string} hand
 * @return {number}
 */
function findMinStep(board, hand) {
  if (board.length === 0) { return 0; }

  let boardArray = board.split("");
  let firstHand = countBalls(hand);

  if (missingBalls(boardArray, firstHand)) { return -1; }

  let queue = createQueue([boardArray, firstHand]);

  let [win, finalHand] = findMinStepIter(queue);
  if (!win) {
    return -1;
  }
  return totalBalls(firstHand) - totalBalls(finalHand);
}

function pickBall(hand, color) {
  if (hand[color] <= 1) {
    let newHand = { ...hand };
    delete newHand[color];
    return newHand;
  } else {
    return { ...hand, [color]: hand[color] - 1 };
  }
}

function emptyHand(hand) {
  for (let color in hand) {
    if (hand[color] > 0) {
      return false;
    }
  }
  return true;
}

function findMinStepIter(queue) {
  while (!queueEmpty(queue)) {
    let [board, hand] = queuePoll(queue);
    if (emptyHand(hand)) {
      continue;
    }

    for (let i = 0; i < board.length; i++) {
      for (let color in hand) {
        let newHand = pickBall(hand, color);
        let newBoard = reduceBalls(
          board.slice(0, i).concat(color).concat(board.slice(i)),
          i
        );

        if (newBoard.length === 0) {
          return [true, newHand];
        }
        if (!emptyHand(newHand) && !missingBalls(newBoard, newHand)) {
          queueOffer(queue, [newBoard, newHand]);
        }
      }
    }
  }
  return [false, null];
}

function test(board, hand, expected) {
  let actual = findMinStep(board, hand);
  if (actual !== expected) {
    console.log(`❌ board = "${board}", hand = "${hand}"\noutput = ${actual} (expected ${expected})`);
  } else {
    console.log(`✅ board = "${board}", hand = "${hand}"\noutput = ${actual}`);
  }
}

test("WRRBBW", "RB", -1);
test("WWRRBBWW", "WRBRW", 2);
test("G", "GGGGG", 2);
test("BRWGWYY", "YGBWY", -1);
test("", "YGBWY", 0);
test("WRGGRRWW", "G", 1);
test("WRGGRWW", "YYYRG", 2);
test("RRYGGYYRRYYGGYRR", "GGBBB", 5);
