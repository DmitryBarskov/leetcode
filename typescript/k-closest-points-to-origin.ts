// https://leetcode.com/problems/k-closest-points-to-origin/

type Point2D = [number, number];

const sqr = (x: number) => x * x;

const distanceToCenter = (point: Point2D): number => {
  const [x, y] = point;
  return Math.sqrt(sqr(x) + sqr(y));
};

function kClosest(points: Point2D[], k: number): Point2D[] {
  points.sort((p1, p2): number => distanceToCenter(p1) - distanceToCenter(p2));
  return points.slice(0, k);
}

console.log(kClosest([[1, 3], [-2, 2]], 1), 'exp:', [[-2, 2]]);
console.log(kClosest([[3, 3], [5, -1], [-2, 4]], 2), 'exp:', [[3, 3], [-2, 4]]);
