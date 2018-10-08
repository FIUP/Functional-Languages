import Data.Char

-- THE CHIPER

-- converts a lower-case lettere into the corresponding integer
let2int :: Char -> Int
let2int c = ord c - ord 'a'

int2let :: Int -> Char
int2let n = chr (ord 'a' + n)

shift :: Int -> Char -> Char
shift n c | isLower c = int2let (mod (let2int c + n) 26)
            | otherwise = c

encode :: Int -> String -> String
encode n xs = [shift n x | x <- xs]

-- CRACKING THE CHIPER

-- english word's frequency table
table :: [Float]
table = [8.1,1.5,2.8,4.2,12.7,2.2,2.0,6.1,7.0,0.2,0.8,4.0,2.4,6.7,7.5,1.9,0.1,6.0,6.3,9.0,2.8,1.0,2.4,0.2,2.0,0.1]

percent :: Int -> Int -> Float
percent n m = (fromIntegral n / fromintegral m) * 100
