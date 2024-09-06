class Solution {
  int maxProfit(List<int> prices) {
    int buy = 0;
    int maximumProfit = 0;
    while (buy < prices.length) {
      int sell = buy;
      while (sell < prices.length) {
        int profit = prices[sell] - prices[buy];
        if (profit < 0) {
          break;
        }
        maximumProfit = max(maximumProfit, profit);
        sell++;
      }
      buy = sell;
    }
    return maximumProfit;
  }
}