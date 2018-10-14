type Peg = String
type Move = (Peg, Peg)

-- | The hanoi function moves the n disks from the peg a to the peg b using the peg c as temporary storage
-- To move all the n disks from a to b :
-- 1 - Moves n-1 disks from a to c
-- 2 - Moves the bottom disk from a to b
-- 3 - Moves n-1 disks from c to b
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 a b c = [("", "")]
hanoi 1 a b c = [(a, b)]
hanoi n a b c = (hanoi (n-1) a c b) ++ [(a, b)] ++ (hanoi (n-1) c b a)





