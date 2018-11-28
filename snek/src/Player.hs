module Player 
    ( Player(..)
    , movePlayer
    ) where

import Movement as M

data Player a = Player [M.Position] a M.Direction
    deriving (Eq, Show)

movePlayer :: Player a -> Player a
movePlayer (Player ps a dir) = Player (nextPos:ps) a dir
        where nextPos = M.move (head ps) dir