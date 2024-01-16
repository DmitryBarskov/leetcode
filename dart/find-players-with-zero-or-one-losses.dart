// @leetup=custom
// @leetup=info id=2225 lang=java slug=find-players-with-zero-or-one-losses

/*
* You are given an integer array `matches` where `matches[i] = [winneri, loseri]`
* indicates that the player `winneri` defeated player `loseri` in a match.
* 
* Return *a list *`answer`* of size *`2`* where:*
* 
* * `answer[0]` is a list of all players that have not lost any matches.
* * `answer[1]` is a list of all players that have lost exactly one match.
* 
* The values in the two lists should be returned in increasing order.
* 
* Note:
* 
* * You should only consider the players that have played at least one match.
* * The testcases will be generated such that no two matches will have the
*   same outcome.
* 
* 
* Example 1:
* 
* Input: matches = [[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10
* ,9]]
* Output: [[1,2,10],[4,5,7,8]]
* Explanation:
* Players 1, 2, and 10 have not lost any matches.
* Players 4, 5, 7, and 8 each have lost one match.
* Players 3, 6, and 9 each have lost two matches.
* Thus, answer[0] = [1,2,10] and answer[1] = [4,5,7,8].
* 
* Example 2:
* 
* Input: matches = [[2,3],[1,3],[5,4],[6,4]]
* Output: [[1,2,5,6],[]]
* Explanation:
* Players 1, 2, 5, and 6 have not lost any matches.
* Players 3 and 4 each have lost two matches.
* Thus, answer[0] = [1,2,5,6] and answer[1] = [].
* 
* 
* Constraints:
* 
* * `1 <= matches.length <= 105`
* * `matches[i].length == 2`
* * `1 <= winneri, loseri <= 105`
* * `winneri != loseri`
* * All `matches[i]` are unique.
* 
*/
import 'package:test/test.dart';

void main() {
  List<List<List<List<int>>>> examples = [
    [
      [[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]],
      [[1,2,10],[4,5,7,8]]
    ],
    [
      [[2,3],[1,3],[5,4],[6,4]],
      [[1,2,5,6],[]]
    ],
    [
      [[132,71],[71,132]],
      [[],[71,132]]
    ],
    [
      [[10245,43823],[13632,50046],[20362,62395],[38675,96507],[42444,90905],[62017,25001],[67125,60162],[89282,95903],[95143,10211],[98000,816]],
      [[10245,13632,20362,38675,42444,62017,67125,89282,95143,98000],[816,10211,25001,43823,50046,60162,62395,90905,95903,96507]]
    ],
    [
      [[2,4],[2,8],[5,10],[6,5],[7,2],[7,6],[7,9],[8,3],[8,7],[9,1]],
      [[],[1,2,3,4,5,6,7,8,9,10]],
    ],
    [
      [[1,2],[1,4],[1,5],[2,1],[3,1],[3,2],[4,3],[4,5],[5,3],[5,4]],
      [[],[]],
    ],
    [
      [[1,38],[1,54],[1,81],[2,25],[2,47],[4,18],[4,37],[4,85],[5,66],[6,80],[7,27],[8,2],[8,45],[8,64],[10,79],[11,5],[11,49],[11,88],[12,6],[12,65],[15,86],[15,95],[16,63],[16,92],[18,30],[18,76],[21,71],[24,78],[26,15],[26,33],[27,57],[28,17],[29,58],[30,68],[31,34],[31,94],[32,83],[33,20],[34,13],[34,48],[37,10],[38,72],[39,67],[39,99],[40,52],[41,1],[41,40],[42,11],[42,29],[43,22],[43,74],[43,97],[47,56],[48,96],[49,39],[49,100],[54,31],[55,19],[56,32],[56,77],[58,51],[59,9],[63,35],[63,84],[64,42],[64,44],[66,50],[66,89],[67,93],[68,36],[69,60],[69,91],[71,75],[72,4],[73,59],[74,12],[75,14],[76,28],[76,41],[76,70],[77,21],[80,3],[80,8],[81,55],[81,61],[84,23],[85,90],[86,7],[87,53],[88,43],[90,26],[90,98],[92,24],[93,69],[93,87],[94,16],[95,82],[96,62],[97,73],[98,46]],
      [[],[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]]
    ]
  ];
  for (var i = 0; i < examples.length; i++) {
    test('Example $i', () {
      expect(
        Solution().findWinners(examples[i][0]),
        examples[i][1]
      );
    });
  }
}
// @leetup=custom
// @leetup=code

class Solution {
  List<List<int>> findWinners(List<List<int>> matches) {
    Set<int> neverLost = {};
    Set<int> lostOnce = {};
    Set<int> lostMore = {};
    for (final [winner, loser] in matches) {
      if ([neverLost, lostOnce, lostMore].every((set) => !set.contains(winner))) {
        neverLost.add(winner);
      }
      if ([neverLost, lostOnce, lostMore].every((set) => !set.contains(loser))) {
        lostOnce.add(loser);
      } else if (neverLost.contains(loser)) {
        neverLost.remove(loser);
        lostOnce.add(loser);
      } else if (lostOnce.contains(loser)) {
        lostOnce.remove(loser);
        lostMore.add(loser);
      }
    }
    List<int> neverLostList = neverLost.toList();
    List<int> lostOnceList = lostOnce.toList();
    neverLostList.sort();
    lostOnceList.sort();
    return [neverLostList, lostOnceList];
  }
}
// @leetup=code
