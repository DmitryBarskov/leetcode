class MyCalendar {
    constructor() {
        this.busyIntervals = [];
    }

    /** 
    * @param {number} start 
    * @param {number} end
    * @return {boolean}
    */
    book(start, end) {
        let left = 0;
        let right = this.busyIntervals.length;

        while (left < right) {
            let mid = Math.floor(left + (right - left) / 2);
            const [midStart, midEnd] = this.busyIntervals[mid];
            if (midStart < end && midEnd > start) {
                return false;
            }

            if (start >= midEnd) {
                left = mid + 1;
            } else {
                right = mid;
            }
        }
        this.busyIntervals.splice(left, 0, [start, end]);
        return true;
    }
}

/** 
 * Your MyCalendar object will be instantiated and called as such:
 * var obj = new MyCalendar()
 * var param_1 = obj.book(start,end)
 */
