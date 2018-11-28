module PlayerTest where

import Test.HUnit
import Player
import Movement as M

movePlayerLeftTest = TestCase (assertEqual "Moving left removes 1 from x and adds it to previous moves" (Player [(0,0),(1,0)] 'X' M.Left) (movePlayer (Player [(1,0)] 'X' M.Left)))
movePlayerRightTest = TestCase (assertEqual "Moving right adds 1 to x and adds it to previous moves" (Player [(2,0),(1,0)] 'X' M.Right) (movePlayer (Player [(1,0)] 'X' M.Right)))
movePlayerUpTest = TestCase (assertEqual "Moving up adds 1 to y and adds it to previous moves" (Player [(1,1),(1,0)] 'X' M.Up) (movePlayer (Player [(1,0)] 'X' M.Up)))
movePlayerDownTest = TestCase (assertEqual "Moving down removes 1 from y and adds it to previous moves" (Player [(1,0),(1,1)] 'X' M.Down) (movePlayer (Player [(1,1)] 'X' M.Down)))

tests = [
    TestLabel "movePlayerLeftTest" movePlayerLeftTest,
    TestLabel "movePlayerRightTest" movePlayerRightTest,
    TestLabel "movePlayerUpTest" movePlayerUpTest,
    TestLabel "movePlayerDownTest" movePlayerDownTest]