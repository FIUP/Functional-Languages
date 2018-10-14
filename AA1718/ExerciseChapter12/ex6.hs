{--
    Define an instance of the Monad class for the type (a ->).
    Remind that:
        return :: a -> m a
        (>>=) :: m a -> (a -> m b) -> m b
        (>>) :: m a -> m b -> m b
 --}

instance Monad ((->) r) where
    -- return :: b -> (r -> b)
    return x = (\_ -> x)

    -- >>= :: (r -> a) -> (a -> (r -> b)) -> (r -> b)
    -- It could be useful think this type in a different way... :: (r -> a) -> (a -> r -> b) -> (r -> b)
    g >>= h = \x -> h (g x) x
