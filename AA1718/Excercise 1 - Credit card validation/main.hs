toDigits :: Integer -> [Integer]
toDigits n = if n > 0 
  then do
    let digits = toInteger(length (show n))
    let firstDigit = div n (10^(digits - 1))
    let rest = mod n (10^(digits -1))
    [firstDigit] ++ toDigits rest
	else 
    []

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther [] = []
doubleEveryOther [x] = [x]
doubleEveryOther (x:y:ns) = x : 2*y : doubleEveryOther ns

sumDigits::[Integer] -> Integer
sumDigits[] = 0
sumDigits(n:ns) = n + sumDigits ns