data Term = Con Int | Add Term Term
            deriving (Show)

type MOut a = (a,Output)
type Output = String

formatLine :: Term -> Int -> Output
formatLine t a = "eval (" ++ show t ++ ") <= " ++ show a ++ " - "

eval0 :: Term -> MOut Int
eval0 (Con a) = (a,formatLine (Con a) a)
eval0 (Add t u) = ((a + b),(x ++ y ++ formatLine (Add t u) (a + b))) where
    (a, x) = eval0 t
    (b, y) = eval0 u



{--########################################################################--}

{-
 Exercise from learnyouhaskell.com
 http://learnyouahaskell.com/a-fistful-of-monads#the-list-monad
  "A knight's quest

Here's a problem that really lends itself to being solved with non-determinism.
Say you have a chess board and only one knight piece on it. 
We want to find out if the knight can reach a certain position in three moves. 
We'll just use a pair of numbers to represent the knight's position on the chess board. 
The first number will determine the column he's in and the second number will determine the row. "

-}

type KnightPos = (Int,Int)  

moveKnight :: KnightPos -> [KnightPos]  
moveKnight (c,r) = filter onBoard  
    [(c+2,r-1),(c+2,r+1),(c-2,r-1),(c-2,r+1)  
    ,(c+1,r-2),(c+1,r+2),(c-1,r-2),(c-1,r+2)  
    ]  
    where onBoard (c,r) = c `elem` [1..8] && r `elem` [1..8]  


in3 :: KnightPos -> [KnightPos]  
in3 start = do   
     first <- moveKnight start  
     second <- moveKnight first  
     moveKnight second  

-- Alternative version with >>= (bind) 
--in3 start = return start >>= moveKnight >>= moveKnight >>= moveKnight

canReachIn3 :: KnightPos -> KnightPos -> Bool  
canReachIn3 start end = end `elem` in3 start 

{--########################################################################--}
