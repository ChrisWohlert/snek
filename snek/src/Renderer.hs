module Renderer
    ( render
    ) where

import Player

type Board = [String]
type BoardSize = (Int, Int)

render :: BoardSize -> [Player Char] -> Board
render = (drawPlayers . drawBoard)

drawBoard :: BoardSize -> Board
drawBoard (w, h) = top:(middle $ h - 1) ++ [bottom]
    where 
        top = replicate w '-'
        middle 0 = []
        middle r = ("|" ++ (replicate (w - 2) ' ') ++ "|"):middle (r - 1)
        bottom = top

drawPlayers :: Board -> [Player Char] -> Board
drawPlayers board [] = board
drawPlayers board (Player [] c:players) = drawPlayers board players
drawPlayers board (Player ((x, y):ps) c:players) = drawPlayers insertPlayer (Player ps c:players)
        where
            insertPlayer = 
                let (top, (row:bottom)) = splitAt y board
                    (a, (b:bs)) = splitAt x row
                in top ++ (a ++ (c:bs)):bottom


            --(startOfBoard ++ [(startOfRow ++ [c] ++ tail endOfRow)] ++ tail endOfBoard)

            -- map (\ (row, index) -> if index == y then map (\ (char, i) -> if i == x then c else char) (zip row [0..]) else row) $ zip board [0..]