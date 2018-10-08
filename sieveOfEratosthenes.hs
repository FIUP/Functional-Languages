primes :: [Int]
primes = sieve [2..]

sieve :: [Int] -> [Int]
sieve (p:xs) = p: sieve [x | x <- xs, mod x p /= 0]

routine = takeWhile (< 100) primes