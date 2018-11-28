module Game
    ( getHeight
    , getWidth
    , Color(..)
    , getPlayers
    ) where

import Data.Int
import Player
import Movement as M

data Color = Red | Green deriving (Eq, Show)

getHeight :: Int32
getHeight = 600

getWidth :: Int32
getWidth = 800

getPlayers :: [Player Color]
getPlayers = [Player [(5,5)] Red M.Right, Player [(595,795)] Green M.Left]