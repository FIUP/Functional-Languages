{-- Define an istance of the Functor class for the following type of binary trees that have data in their nodes:
    data Tree a = Leaf | Node (Tree a) a (Tree a)
 --}

 data Tree a = Leaf | Node (Tree a) a (Tree a)
            deriving Show


 instance Functor Tree where
    -- fmap :: (a -> b) -> Tree a -> Tree b
    fmap g Leaf = Leaf
    fmap f (Node l x r) = Node (fmap f l) (f x) (fmap f r) 