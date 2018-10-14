{-# OPTIONS_GHC -Wall #-}
module LogAnalysis where
    
import Log

{-Take the first word of a String-}
takeFirstWord :: String -> String

takeFirstWord [] = []

takeFirstWord (x:xs)
    | [x] /= " " = [x] ++ takeFirstWord xs
    | otherwise = []
 
dropFirstWord :: String -> String

dropFirstWord [] = []

dropFirstWord (x:xs)
    | [x] /= " " = dropFirstWord xs
    | otherwise = xs

infoMessage :: String -> LogMessage

infoMessage msg = 
    LogMessage Info (read (takeFirstWord msg) :: Int) (dropFirstWord msg)

errorMessage :: String -> LogMessage

errorMessage msg = 
    LogMessage (Error (read (takeFirstWord msg) :: Int)) (read (takeFirstWord ( dropFirstWord msg)) :: Int) (dropFirstWord (dropFirstWord msg))

warningMessage :: String -> LogMessage

warningMessage msg = 
    LogMessage Warning (read (takeFirstWord msg) :: Int) (dropFirstWord msg)
    

{-parses an individual line from the log file.-}
parseMessage :: String -> LogMessage

parseMessage msg = 
    if first_word == "I" then infoMessage (dropFirstWord msg)
    else if first_word == "E" then errorMessage (dropFirstWord msg)
    else if first_word == "W" then warningMessage (dropFirstWord msg)
    else Unknown "This is not in the right format."
    where first_word = takeFirstWord msg 
    

{-parse a whole log file-}
parse :: String -> [LogMessage]

parse [] = []

parse path = 
    do x <- readFile 
        let parseAux (lines x)

parseAux :: [String] -> [LogMessage]

parseAux [] = []

parseAux filecontent = 
    parseMessage (filecontent !! 1) ++ parseAux (drop 1 filecontent)

