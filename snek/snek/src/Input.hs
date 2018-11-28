module Input where

import Movement as M

getDirection :: Char -> M.Direction
getDirection 'a' = M.Left
getDirection 'd' = M.Right
getDirection 'w' = M.Up
getDirection 's' = M.Down