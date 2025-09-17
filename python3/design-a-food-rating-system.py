import heapq

class FoodRatings:
    """
    >>> food_ratings = FoodRatings(["kimchi", "miso", "sushi", "moussaka", "ramen", "bulgogi"], ["korean", "japanese", "japanese", "greek", "japanese", "korean"], [9, 12, 8, 15, 14, 7])
    >>> food_ratings.highestRated("korean")
    'kimchi'
    >>> food_ratings.highestRated("japanese")
    'ramen'
    >>> food_ratings.changeRating("sushi", 16)
    >>> food_ratings.highestRated("japanese")
    'sushi'
    >>> food_ratings.changeRating("ramen", 16)
    >>> food_ratings.highestRated("japanese")
    'ramen'

    >>> food_ratings = FoodRatings(["emgqdbo", "jmvfxjohq", "qnvseohnoe", "yhptazyko", "ocqmvmwjq"], ["snaxol", "snaxol", "snaxol", "fajbervsj", "fajbervsj"], [2, 6, 18, 6, 5])
    >>> food_ratings.changeRating("qnvseohnoe", 11)
    >>> food_ratings.highestRated("fajbervsj")
    'yhptazyko'
    >>> food_ratings.changeRating("emgqdbo", 3)
    >>> food_ratings.changeRating("jmvfxjohq", 9)
    >>> food_ratings.changeRating("emgqdbo", 14)
    >>> food_ratings.highestRated("fajbervsj")
    'yhptazyko'
    >>> food_ratings.highestRated("snaxol")
    'emgqdbo'
    """

    def __init__(self, foods: list[str], cuisines: list[str], ratings: list[int]):
        self.cuisine_to_ratings = {}
        self.food_to_last_rating = {}
        self.food_to_cuisine = {}
        for cuisine, food, rating in zip(cuisines, foods, ratings):
            if cuisine not in self.cuisine_to_ratings:
                self.cuisine_to_ratings[cuisine] = []
            self.food_to_cuisine[food] = cuisine
            self.changeRating(food, rating)

    def changeRating(self, food: str, newRating: int) -> None:
        cuisine_ratings = self.cuisine_to_ratings[self.food_to_cuisine[food]]
        heapq.heappush(cuisine_ratings, (-newRating, food, newRating))
        self.food_to_last_rating[food] = newRating

    def highestRated(self, cuisine: str) -> str:
        ratings = self.cuisine_to_ratings[cuisine]
        while True:
            _key, food, rating = ratings[0]
            if self.food_to_last_rating[food] == rating:
                return food
            else:
                heapq.heappop(ratings)
