-- Work out the types for the variables in the four applicative laws

{-- 
    Remind that:
        pure :: a -> f a
        <*> :: f (a -> b) -> f a -> f b

    (1) identity law: pure id <*> x = x
        We have two variables: "id" and "x".
        - id is a function, so :t id :: a -> a, and :t pure id :: f (a -> a)
        - x is a variables "inside" an applicative, so its type must be x :: f a
    
    (2) homomorphism law: pure (g x) = pure g <*> pure x
        it means that pure function preserve function application.
        We have two variables "g" and "x".
        - g is a "simple" function (hence is not an "applicative" function) wich is the argument of pure function, so its type
          must be g :: a -> b, and :t pure g :: f (a -> b)
        - even x is a "simpe" variables, so its type must be x :: a, and :t pure (g x) :: f b . 
          Notice that "x" is the argument of "g", hence "x" and input of "g" must have the same type.

    (3) interchange law: x <*> pure y = pure (\g -> g y) <*> x
        - x is the left argument of <*>, so its type must be x :: f (a -> b)
        - y is the argument of pure, so its type must be y :: a, and :t pure y :: f a.
          Moreover, :t pure (\g -> g y) :: f ((a -> b) -> b)

    (4) composition law: x <*> (y <*> z) = (pure (.) <*> x <*> y) <*> z
        - x is the left argument of the outer <*>, so its type must be x :: f (a -> b)
        - even y is the left argument of the inner <*>, so its type must be y :: f (c -> a)
        - z is the right argument of <*>, so its type must be z :: f c 
        - y <*> z is the right argument of the outer <*>, so its type must be y <*> z :: f a.
        - :t pure (.) :: (f (a -> b) -> f (c -> a)) -> f (c -> b). !!! ACTUALLY I'M NOT SURE OF THIS LAST POINT !!!
        
--}