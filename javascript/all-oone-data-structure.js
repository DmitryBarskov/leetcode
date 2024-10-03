class AllOne {
    keyToCount;
    countToKey;
    minCount;
    maxCount;

    constructor() {
        this.keyToCount = new Map();
        this.countToKey = new Map();
        this.minCount = null;
        this.maxCount = null;
    }

    /**
    * @param {string} key
    * @return {void}
    */
    inc(key) {
        if (!this.keyToCount.has(key)) {
            this.keyToCount.set(key, 1);
            this.moveKey(key, 0, 1);
            this.minCount = 1;
            this.maxCount ??= 1;
            return;
        }
        const currentCount = this.keyToCount.get(key) ?? 0;
        this.keyToCount.set(key, currentCount + 1);
        this.moveKey(key, currentCount, currentCount + 1);
        if (currentCount == this.minCount && (this.countToKey.get(currentCount)?.size ?? 0) == 0) {
            this.minCount++;
        }
        if (currentCount == this.maxCount) {
            this.maxCount++;
        }
    }

    /**
    * @param {string} key
    * @return {void}
    */
    dec(key) {
        if (this.keyToCount.get(key) === 1) {
            this.keyToCount.delete(key);
            this.countToKey.get(1).delete(key);
            if (this.countToKey.get(1).size == 0) {
                this.countToKey.delete(1);
            }

            if (this.keyToCount.size == 0) {
                this.minCount = null;
                this.maxCount = null;
            } else if (!this.countToKey.has(1)) {
		// TODO: improve performance to O(1)
                this.minCount = Math.min(...this.countToKey.keys());
            }
            return;
        }
        const currentCount = this.keyToCount.get(key);
        this.keyToCount.set(key, currentCount - 1);
        this.moveKey(key, currentCount, currentCount - 1);
        if (currentCount === this.maxCount && (this.countToKey.get(currentCount)?.size ?? 0) == 0) {
            this.maxCount--;
        }
        if (currentCount === this.minCount) {
            this.minCount--;
        }
    }

    /**
    * @return {string}
    */
    getMaxKey() {
        if (this.maxCount == null) {
            return "";
        }
        return this.countToKey.get(this.maxCount).keys().next().value;
    }

    /**
    * @return {string}
    */
    getMinKey() {
        if (this.minCount == null) {
            return "";
        }
        return this.countToKey.get(this.minCount).keys().next().value;
    }

    moveKey(key, fromCount, toCount) {
        this.countToKey.get(fromCount)?.delete(key);
        if ((this.countToKey.get(fromCount)?.size ?? 0) === 0) {
            this.countToKey.delete(fromCount);
        }
        if (!this.countToKey.has(toCount)) {
            this.countToKey.set(toCount, new Set());
        }
        this.countToKey.get(toCount).add(key);
    }
}
