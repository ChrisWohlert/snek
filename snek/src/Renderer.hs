module Renderer
    ( render
    ) where

import Player

type Board = [String]
type BoardSize = (Int, Int)

render :: BoardSize -> [Player Char] -> Board
render (w, h) = (drawPlayers . drawBoard) (w, h)

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
            insertPlayer = (startOfBoard ++ [(startOfRow ++ [c] ++ tail endOfRow)] ++ tail endOfBoard)
            endOfBoard = drop y board
            endOfRow = drop x row
            startOfRow = take x row
            startOfBoard = take y board
            row = head endOfBoard