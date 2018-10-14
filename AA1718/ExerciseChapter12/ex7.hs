{--
    Given the following type of expressions
        data Expr a = Var a | Val Int | Add (Expr a) (Expr a)
                    deriving Show
    
    that contain variables of some type a, show how to make this type into instances of the Functor, Applicative and Monad classes.
    With the aid of an example, explain what the >>= operator for this type does
--}

data Expr a = Var a | Val Int | Add (Expr a) (Expr a)
            deriving Show

instance Functor Expr where
    -- fmap :: (a -> b) -> Expr a -> Expr b
    fmap _ (Val x) = Val x 
    fmap g (Var x) = Var (g x)
    fmap g (Add l r) = Add (fmap g l) (fmap g r)
    

instance Applicative Expr where
    -- pure :: a -> Expr a
    pure x = Var x

    -- <*> :: Expr (a -> b) -> Expr a -> Expr b
    _ <*> Val x = Val x
    Var g <*> e = fmap g e
    Add g h <*> e = Add (g <*> e) (h <*> e)

instance Monad Expr where
    -- return :: a -> Expr a
    return = pure

    -- >>= :: Expr a -> (a -> Expr b) -> Expr b
    Val x >>= _ = Val x
    Var x >>= g = g x
    Add l r >>=g = Add (l >>= g) (r >>= g)
