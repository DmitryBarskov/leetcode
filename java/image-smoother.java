// @leetup=custom
// @leetup=info id=661 lang=java slug=image-smoother

/*
* An image smoother is a filter of the size `3 x 3` that can be applied to
* each cell of an image by rounding down the average of the cell and the eight
* surrounding cells (i.e., the average of the nine cells in the blue smoother). If
* one or more of the surrounding cells of a cell is not present, we do not
* consider it in the average (i.e., the average of the four cells in the red
* smoother).
* 
* Given an `m x n` integer matrix `img` representing the grayscale of an image,
* return *the image after applying the smoother on each cell of it*.
* 
* 
* Example 1:
* 
* Input: img = [[1,1,1],[1,0,1],[1,1,1]]
* Output: [[0,0,0],[0,0,0],[0,0,0]]
* Explanation:
* For the points (0,0), (0,2), (2,0), (2,2): floor(3/4) = floor(0.75) = 0
* For the points (0,1), (1,0), (1,2), (2,1): floor(5/6) = floor(0.83333333) = 0
* For the point (1,1): floor(8/9) = floor(0.88888889) = 0
* 
* Example 2:
* 
* Input: img = [[100,200,100],[200,50,200],[100,200,100]]
* Output: [[137,141,137],[141,138,141],[137,141,137]]
* Explanation:
* For the points (0,0), (0,2), (2,0), (2,2): floor((100+200+200+50)/4) = floor(137
* .5) = 137
* For the points (0,1), (1,0), (1,2), (2,1): floor((200+200+50+200+100+100)/6) = f
* loor(141.666667) = 141
* For the point (1,1): floor((50+200+200+200+200+100+100+100+100)/9) = floor(138.8
* 88889) = 138
* 
* 
* Constraints:
* 
* * `m == img.length`
* * `n == img[i].length`
* * `1 <= m, n <= 200`
* * `0 <= img[i][j] <= 255`
* 
*/
// @leetup=custom
// @leetup=code

class Solution {
    public int[][] imageSmoother(int[][] img) {
        int m = img.length;
        int n = img[0].length;
        int[][] smooth = new int[m][n];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                smooth[i][j] = averageIn3x3(img, i, j);
            }
        }
        return smooth;
    }

    static int averageIn3x3(int[][] img, int row, int col) {
        int sum = img[row][col];
        int count = 1;
        if (hasIndex(img, row - 1, col - 1)) {
            sum += img[row - 1][col - 1];
            count++;
        }
        if (hasIndex(img, row - 1, col)) {
            sum += img[row - 1][col];
            count++;
        }
        if (hasIndex(img, row - 1, col + 1)) {
            sum += img[row - 1][col + 1];
            count++;
        }
        if (hasIndex(img, row, col - 1)) {
            sum += img[row][col - 1];
            count++;
        }
        if (hasIndex(img, row, col + 1)) {
            sum += img[row][col + 1];
            count++;
        }
        if (hasIndex(img, row + 1, col - 1)) {
            sum += img[row + 1][col - 1];
            count++;
        }
        if (hasIndex(img, row + 1, col)) {
            sum += img[row + 1][col];
            count++;
        }
        if (hasIndex(img, row + 1, col + 1)) {
            sum += img[row + 1][col + 1];
            count++;
        }
        return sum / count;
    }

    static boolean hasIndex(int[][] arr, int i, int j) {
        return 0 <= i && i < arr.length && 0 <= j && j < arr[i].length;
    }

}
// @leetup=code
