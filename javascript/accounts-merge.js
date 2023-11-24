// @leetup=custom
// @leetup=info id=721 lang=javascript slug=accounts-merge

/*
 * Given a list of `accounts` where each element `accounts[i]` is a list of
 * strings, where the first element `accounts[i][0]` is a name, and the rest of the
 * elements are emails representing emails of the account.
 *
 * Now, we would like to merge these accounts. Two accounts definitely belong to
 * the same person if there is some common email to both accounts. Note that even
 * if two accounts have the same name, they may belong to different people as
 * people could have the same name. A person can have any number of accounts
 * initially, but all of their accounts definitely have the same name.
 *
 * After merging the accounts, return the accounts in the following format: the
 * first element of each account is the name, and the rest of the elements are
 * emails in sorted order. The accounts themselves can be returned in any
 * order.
 *
 * Example 1:
 *
 * Input: accounts = [
 *   ["John","johnsmith@mail.com","john_newyork@mail.com"],
 *   ["John","johnsmith@mail.com","john00@mail.com"],
 *   ["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]
 * ]
 * Output: [
 *   ["John","john00@mail.com","john_newyork@mail.com","johnsmith@mail.com"],
 *   ["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]
 * ]
 * Explanation:
 * The first and second John's are the same person as they have the common email "j
 * ohnsmith@mail.com".
 * The third John and Mary are different people as none of their email addresses ar
 * e used by other accounts.
 * We could return these lists in any order, for example the answer [['Mary', 'mary
 * @mail.com'], ['John', 'johnnybravo@mail.com'],
 * ['John', 'john00@mail.com', 'john_newyork@mail.com', 'johnsmith@mail.com']] woul
 * d still be accepted.
 *
 * Example 2:
 *
 * Input: accounts = [
 *   ["Gabe","Gabe0@m.co","Gabe3@m.co","Gabe1@m.co"],
 *   ["Kevin","Kevin3@m.co","Kevin5@m.co","Kevin0@m.co"],
 *   ["Ethan","Ethan5@m.co","Ethan4@m.co", "Ethan0@m.co"],
 *   ["Hanzo","Hanzo3@m.co","Hanzo1@m.co","Hanzo0@m.co"],
 *   ["Fern","Fern5@m.co","Fern1@m.co","Fern0@m.co"]
 * ]
 * Output: [
 *   ["Ethan","Ethan0@m.co","Ethan4@m.co","Ethan5@m.co"],
 *   ["Gabe","Gabe0@m.co","Gabe1@m.co","Gabe3@m.co"],
 *   ["Hanzo","Hanzo0@m.co","Hanzo1@m.co","Hanzo3@m.co"],
 *   ["Kevin","Kevin0@m.co","Kevin3@m.co","Kevin5@m.co"],
 *   ["Fern","Fern0@m.co","Fern1@m.co","Fern5@m.co"]
 * ]
 *
 * Constraints:
 *
 * * `1 <= accounts.length <= 1000`
 * * `2 <= accounts[i].length <= 10`
 * * `1 <= accounts[i][j].length <= 30`
 * * `accounts[i][0]` consists of English letters.
 * * `accounts[i][j] (for j > 0)` is a valid email.
 */

import { assertArrayIncludes, assertEquals } from "std/assert/mod.ts";

Deno.test("example 1", () => {
  const accounts = [
    ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
    ["John", "johnsmith@mail.com", "john00@mail.com"],
    ["Mary", "mary@mail.com"],
    ["John", "johnnybravo@mail.com"],
  ];
  assertArrayIncludes(
    accountsMerge(accounts),
    [
      ["John", "john00@mail.com", "john_newyork@mail.com", "johnsmith@mail.com"],
      ["Mary", "mary@mail.com"],
      ["John", "johnnybravo@mail.com"],
    ],
  );
});

Deno.test("example 2", () => {
  const accounts = [
    ["Gabe", "Gabe0@m.co", "Gabe3@m.co", "Gabe1@m.co"],
    ["Kevin", "Kevin3@m.co", "Kevin5@m.co", "Kevin0@m.co"],
    ["Ethan", "Ethan5@m.co", "Ethan4@m.co", "Ethan0@m.co"],
    ["Hanzo", "Hanzo3@m.co", "Hanzo1@m.co", "Hanzo0@m.co"],
    ["Fern", "Fern5@m.co", "Fern1@m.co", "Fern0@m.co"],
  ];
  assertArrayIncludes(
    accountsMerge(accounts),
    [
      ["Ethan", "Ethan0@m.co", "Ethan4@m.co", "Ethan5@m.co"],
      ["Gabe", "Gabe0@m.co", "Gabe1@m.co", "Gabe3@m.co"],
      ["Hanzo", "Hanzo0@m.co", "Hanzo1@m.co", "Hanzo3@m.co"],
      ["Kevin", "Kevin0@m.co", "Kevin3@m.co", "Kevin5@m.co"],
      ["Fern", "Fern0@m.co", "Fern1@m.co", "Fern5@m.co"],
    ],
  );
});

Deno.test("failed case", () => {
  const accounts = [
    ["David", "David0@m.co", "David1@m.co"],
    ["David", "David3@m.co", "David4@m.co"],
    ["David", "David4@m.co", "David5@m.co"],
    ["David", "David2@m.co", "David3@m.co"],
    ["David", "David1@m.co", "David2@m.co"],
  ];
  assertArrayIncludes(
    accountsMerge(accounts),
    [
      ["David", "David0@m.co", "David1@m.co", "David2@m.co", "David3@m.co", "David4@m.co", "David5@m.co"],
    ],
  );
});
// @leetup=custom
// @leetup=code

function accountsMerge(accounts) {
  const people = groupByName(accounts);

  const mergedAccounts = [];

  people.forEach((accs, name) => {
    const graph = buildGraph(accs);
    console.log(graph);
    findConnectedComponents(graph).forEach(component => {
      mergedAccounts.push([name, ...component.sort()]);
    })
  });
  return mergedAccounts;
}

function buildGraph(accs) {
  const graph = {};
  accs.forEach((accountEmails) => {
    for (const email of accountEmails) {
      graph[email] ??= new Set();
      for (const adj of accountEmails) {
        graph[email].add(adj);
      }
    }
  });
  return graph;
}

function findConnectedComponents(graph) {
  const visited = new Array(Object.keys(graph).length);
  const components = [];
  for (const email in graph) {
    const currentComponent = [];
    dfs(graph, email, (node) => {
      if (visited[node]) {
        return false;
      }
      currentComponent.push(node);
      visited[node] = true;
      return true;
    });
    if (currentComponent.length > 0) {
      components.push(currentComponent);
    }
  }
  return components;
}

function dfs(graph, startingNode, callback) {
  const stack = [startingNode];
  while (stack.length > 0) {
    const node = stack.pop();
    if (!callback(node)) {
      continue;
    }
    for (const adj of graph[node]) {
      stack.push(adj);
    }
  }
}

function groupByName(accounts) {
  const byName = new Map();
  for (let i = 0; i < accounts.length; i++) {
    let nameGroup = byName.get(accounts[i][0]);
    if (nameGroup === undefined) {
      nameGroup = [];
      byName.set(accounts[i][0], nameGroup);
    }
    const emails = new Set();
    for (let j = 1; j < accounts[i].length; j++) {
      emails.add(accounts[i][j]);
    }
    nameGroup.push(emails);
  }
  return byName;
}
// @leetup=code
