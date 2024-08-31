class UnionFind {
    private size: number;
    private rank: number[];
    private parent: number[];

    constructor(size: number) {
        this.rank = new Array<number>(size).fill(1);
        this.parent = new Array<number>(size);
        this.size = size;
        for (let i = 0; i < size; i++) {
            this.parent[i] = i;
        }
    }

    find(item: number): number {
        if (this.parent[item] === item) {
            return item;
        }
        return this.find(this.parent[item]);
    }

    union(item1: number, item2: number): void {
        if (item1 !== this.parent[item1]) {
            return this.union(this.find(item1), item2);
        }
        if (item2 !== this.parent[item2]) {
            return this.union(item1, this.find(item2));
        }
        if (item1 === item2) { return; }

        this.size--;
        if (this.rank[item1] >= this.rank[item2]) {
            this.parent[item2] = item1;
            this.rank[item1] += this.rank[item2];
        } else {
            this.parent[item1] = item2;
            this.rank[item2] += this.rank[item1];
        }
    }

    get length(): number {
        return this.size;
    }
}

function removeStones(stones: number[][]): number {
    const lastByX = new Map<number, number>();
    const lastByY = new Map<number, number>();
    const connected = new UnionFind(stones.length);
    for (let i = 0; i < stones.length; i++) {
        let [x, y] = stones[i];
        if (lastByX.has(x)) {
            connected.union(i, lastByX.get(x));
        }
        if (lastByY.has(y)) {
            connected.union(i, lastByY.get(y));
        }
        lastByX.set(x, i);
        lastByY.set(y, i);
    }
    return stones.length - connected.length;
}
