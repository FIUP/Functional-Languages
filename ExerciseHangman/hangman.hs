import System.IO

getLine :: IO String
getLine = 
    do x <- getChar
       if x == '\n' 
           then return []
       else
           do xs <- Main.getLine
              return (x:xs)

putStr :: String -> IO ()
putStr [] = return ()
putStr (x:xs) =
    do putChar x
       Main.putStr xs

putStrLn :: String -> IO ()
putStrLn xs = 
    do Main.putStr xs
       putChar '\n'

strlen :: IO ()
strlen =
    do Main.putStr "Enter a string: "
       xs <- Main.getLine
       Main.putStr "The string has "
       Main.putStr (show (length xs))
       Main.putStrLn " characters"

hangman :: IO ()
hangman = 
    do Main.putStrLn "Think of a word:"
       word <- sgetLine
       Main.putStrLn "Try to guess it:"
       play word

sgetLine :: IO String
sgetLine = 
    do x <- getCh
       if x == '\n' 
          then do putChar x
                  return []
          else do putChar '-'
                  xs <- sgetLine
                  return (x:xs)

getCh :: IO Char
getCh = 
    do hSetEcho stdin False
       x <- getChar
       hSetEcho stdin True
       return x

play :: String -> IO ()
play word =
    do Main.putStr "? "
       guess <- Main.getLine
       if guess == word
            then Main.putStrLn "You got it!"
       else
            do Main.putStrLn (match word guess)
               play word

match :: String -> String -> String
match xs ys = [if elem x ys then x else '-' | x <- xs]
