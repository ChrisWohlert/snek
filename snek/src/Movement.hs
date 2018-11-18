module Movement
    ( Direction(..)
    , Position
    , move
    , isCollision
    ) where 

data Direction = Left | Right | Up | Down
        deriving (Eq, Show)
type Position = (Int, Int)

move :: Position -> Direction -> Position
move (a, b) Movement.Left = (a - 1, b)
move (a, b) Movement.Right = (a + 1, b)
move (a, b) Movement.Up = (a, b + 1)
move (a, b) Movement.Down = (a, b - 1)

isCollision :: Position -> [Position] -> Bool
isCollision p1 p2 = p1 `elem` p2