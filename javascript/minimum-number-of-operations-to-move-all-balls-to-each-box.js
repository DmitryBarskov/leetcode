/**
 * @param {string} boxes
 * @return {number[]}
 */
function minOperations(boxes) {
    const totalDistance = new Array(boxes.length).fill(0);
    let ballsOnRight = 0;
    for (let i = 0; i < boxes.length; i++) {
        if (boxes[i] == '1') {
            totalDistance[0] += i;
            ballsOnRight += 1;
        }
    }
    let ballsOnLeft = 0;
    for (let i = 1; i < boxes.length; i++) {
        if (boxes[i - 1] == 1) {
            ballsOnLeft += 1;
        }
        if (boxes[i - 1] == 1) {
            ballsOnRight -= 1;
        }
        totalDistance[i] = totalDistance[i - 1] - ballsOnRight + ballsOnLeft;
    }
    return totalDistance;
}
