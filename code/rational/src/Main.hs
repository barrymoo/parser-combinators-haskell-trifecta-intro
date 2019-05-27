module Main where

import           Data.Ratio    ((%))
import           Text.Trifecta

p :: Parser a -> String -> Result a
p f i = parseString f mempty i

parseRational :: Parser Rational
parseRational = (%) <$> numer <*> (char '/' *> denom)
  where
    numer = decimal
    denom = decimal

main :: IO ()
main = do
  print $ p parseRational "1/1"
