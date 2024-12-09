const STONE = '#';
const WALL = '*';
const EMPTY = '.';

function rotateTheBox(box: string[][]): string[][] {
    const rotated = new Array<Array<string>>(box[0].length);
    for (let i = 0; i < rotated.length; i++) {
        rotated[i] = new Array<string>(box.length);
    }
    for (let i = 0; i < box.length; i++) {
        const column = rotated[0].length - i - 1;
        let lastEmptySpace = 0;
        for (let j = 0; j < box[i].length; j++) {
            rotated[j][column] = box[i][j];
            if (box[i][j] == WALL) {
                lastEmptySpace = j + 1;
            } else if (box[i][j] == EMPTY) {
                [rotated[lastEmptySpace][column], rotated[j][column]] = [
                    rotated[j][column], rotated[lastEmptySpace][column]
                ];
                lastEmptySpace++;
            }
        }
    }
    return rotated;
}
