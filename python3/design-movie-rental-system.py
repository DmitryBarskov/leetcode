from typing import List

import heapq


class MovieRentingSystem:
    def __init__(self, n: int, entries: List[List[int]]):
        # n shops
        self.price_by_shop_and_movie = {}
        self.by_movies = {}
        self.rented = set()
        self.cheapest_rented = []
        for shop, movie, price in entries:
            self.price_by_shop_and_movie[(shop, movie)] = price
            if movie not in self.by_movies:
                self.by_movies[movie] = []
            heapq.heappush(self.by_movies[movie], (price, shop, movie, price))

    def search(self, movie: int) -> List[int]:
        # finds 5 cheapest shops with unrented movie
        if movie not in self.by_movies:
            self.by_movies[movie] = []
            return []
        cheapest = self.by_movies[movie]
        popped = []
        shops = []
        while len(shops) < 5 and len(cheapest) > 0:
            entry = heapq.heappop(cheapest)
            popped.append(entry)
            _key, shop, movie, _price = entry
            if (shop, movie) in self.rented:
                continue
            shops.append(shop)
        for entry in popped:
            heapq.heappush(cheapest, entry)
        return shops

    def rent(self, shop: int, movie: int) -> None:
        # rents unrented copy
        self.rented.add((shop, movie))
        price = self.price_by_shop_and_movie[(shop, movie)]
        heapq.heappush(
            self.cheapest_rented,
            (price, shop, movie, price)
        )

    def drop(self, shop: int, movie: int) -> None:
        # return rented copy to given shop
        self.rented.remove((shop, movie))

    def report(self) -> List[List[int]]:
        # return 5 cheapest rented movies [[shop, movie]]
        five_cheapest_rented = []
        five_cheapest_rented_set = set()
        while len(five_cheapest_rented_set) < 5 and len(self.cheapest_rented) > 0:
            _key, shop, movie, price = heapq.heappop(self.cheapest_rented)
            if (shop, movie) not in self.rented or (shop, movie, price) in five_cheapest_rented_set:
                continue
            five_cheapest_rented.append((shop, movie, price))
            five_cheapest_rented_set.add((shop, movie, price))

        for shop, movie, price in five_cheapest_rented:
            heapq.heappush(self.cheapest_rented, (price, shop, movie, price))

        return [[shop, movie] for shop, movie, _price in five_cheapest_rented]

