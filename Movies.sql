SELECT DISTINCT MOVIE_TITLE, RETAIL_PRICE_VHS, RETAIL_PRICE_DVD
FROM        MOVIE
WHERE Movie_Title = (@Movie)