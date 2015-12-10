> import Prelude hiding (Maybe, Just, Nothing, [])
> 
> data Maybe' a = Just' a | Nothing'
> -- what is the difference between data and type?
> instance Monad Maybe' where
> --   (>>=) :: Maybe a -> (a -> Maybe b) -> Maybe b
> -- type signatures are not allowed in instance declarations
>   Nothing' >>= _ = Nothing'
> --   Just a  >>= f = fmap f $ Just a
>   -- Just' a  >>= f = Just' (f a)
>   Just' a  >>= f = Just' (f a)
>   
> --    return :: a -> Maybe a
>   return = \a -> Just' a

-- > instance Monad [] where
-- >   (>>=) :: [a] -> (a -> [b]) -> [b]
-- >   [a] >>= f = fmap f [a]
-- > -- functor is something that can be mapped over
-- > -- and thus fmap is a fundamental operation.
-- >   return = \a -> [a]
