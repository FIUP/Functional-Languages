{--
    Rather than making a parameterised type into instances of the Functor, Applicative, and Monad classes in this order,
    in practice it is sometimes simpler to define the functor and applicative instances in terms of the monad instance,
    relying on the fact that the order in wich declarations are made is not important in Haskell.
    Complete the missing parts in the following declarations for the ST type using the do notation.

    instance Functor ST where
        -- fmap :: (a -> b) -> ST a -> ST b
        fmap g st = do ...

    instance Applicative ST where 
        -- pure :: a -> ST a
        pure x = S (\s -> (x,s))

        -- <*> :: ST (a -> b) -> ST a -> ST b
        stf <*> stx = do ...

    instance Monad ST where
        -- (>>=) :: ST a -> (a -> ST b) -> ST b
        st >>= f = S (\s -> let (x,s1) = app st s
                                         in app (f x) s1)

--}

type State = Int

newtype ST a = S (State -> (a, State))

app :: ST a -> State -> (a,State)
app (S st) x = st x

instance Functor ST where
    -- fmap :: (a -> b) -> ST a -> ST b
    fmap f st = do  x <- st
                    return (f x)

instance Applicative ST where 
    -- pure :: a -> ST a
    pure x = S (\s -> (x,s))

    -- <*> :: ST (a -> b) -> ST a -> ST b
    stf <*> stx = do f <- stf
                     x <- stx
                     return (f x)

instance Monad ST where
    -- return :: a -> ST a
    return = pure

    -- (>>=) :: ST a -> (a -> ST b) -> ST b
    st >>= f = S (\s -> let (x,s1) = app st s
                                     in app (f x) s1)