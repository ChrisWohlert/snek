module Player 
    ( Player(..)
    , movePlayer
    ) where

import Movement as M

data Player a = Player [M.Position] a
    deriving (Eq, Show)

movePlayer :: Player a -> M.Direction -> Player a
movePlayer (Player ps a) dir = Player (nextPos:ps) a
        where nextPos = M.move (head ps) dir