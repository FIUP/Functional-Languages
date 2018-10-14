-- Converts an Integer input into a list of Integers each one representing a digit of the original number
-- 1234 -> [1, 2, 3, 4]
toDigits::Integer -> [Integer]
toDigits x 
  | x <= 0 = []
  | x > 0 = toDigits(x `div` 10) ++ [x `mod` 10]

-- Doubles every othre item of the input list by starting from the last one and going to the left
-- [1,2,3] -> [1,4,3]
-- [1,2,3,4] -> [2,3,6,4]
doubleEveryOther::[Integer] -> [Integer]
doubleEveryOther [] = []
doubleEveryOther [x] = [x]
doubleEveryOther (x:y:ns)
  | length ns `mod` 2 == 0 = 2*x : y : doubleEveryOther ns
  | otherwise = x : 2*y : doubleEveryOther ns

-- Sums up the digits that are present inside the 
sumDigits::[Integer] -> Integer
sumDigits[] = 0
sumDigits(n:ns) = sum(toDigits n) + sumDigits ns

validate :: Integer -> Bool
validate n = sumDigits(doubleEveryOther(toDigits n)) `mod` 10 == 0