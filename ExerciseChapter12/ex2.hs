{-- Complete the following instance declaration to make the partially-applyed function type (a ->) into a funtor:
    instance Functor ((->) a) where
    
    Hint: first write down the type of fmap, and then think if you already know a library function that has this type
--}

instance Functor ((->) r) where
    -- fmap :: (a -> b) -> (r -> a) -> (r -> b)
    fmap f g = f . g
    -- or fmap f g = (\x -> f (g x)) or fmap f g = (.)
