class CustomStack {
    constructor(maxSize) {
        this.array = new Array(maxSize);
        this.actualSize = 0;
    }

    push(num) {
        if (this.actualSize >= this.array.length) {
            return;
        }
        this.array[this.actualSize] = num;
        this.actualSize++;
    }

    pop() {
        if (this.actualSize <= 0) {
            return -1;
        }
        this.actualSize--;
        return this.array[this.actualSize];
    }

    increment(k, val) {
        for (let i = Math.min(k, this.actualSize) - 1; i >= 0; i--) {
            this.array[i] += val;
        }
    }
}
