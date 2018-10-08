{-- Define an instance of the Applicative class for the type (a ->). If you are familiar with combinatory logic, 
    you might recognise pure and <*> for this type as being the well-know K and S combinators --}

instance Applicative ((->) r) where
    -- pure b -> (a -> b)
    pure x = (\_ -> x)  
    
    -- <*> :: (r -> a -> b) -> (r -> a) -> (r -> b) 
    -- Our Applicative is a function.  
    f <*> g = (\x -> f x (g x))
    
    