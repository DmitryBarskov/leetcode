function minOperations(logs: string[]): number {
    let steps = 0;
    logs.forEach(step => {
        if (step == "../" && steps > 0) {
            steps -= 1;
        } else if (step == "./" || step == "../") {
        } else {
            steps += 1;
        }
    });
    return steps;
}