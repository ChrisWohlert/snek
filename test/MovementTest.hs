module MovementTest where

import Test.HUnit
import Movement as M

moveLeftTest = TestCase (assertEqual "Moving left removes 1 from x" (0,0) (M.move (1,0) M.Left))
moveRightTest = TestCase (assertEqual "Moving right adds 1 to x" (1,0) (M.move (0,0) M.Right))
moveUpTest = TestCase (assertEqual "Moving up adds 1 to y" (0,1) (M.move (0,0) M.Up))
moveDownTest = TestCase (assertEqual "Moving up removes 1 from y" (0,0) (M.move (0,1) M.Down))

isCollisionTest = TestCase (assertEqual "Given a position that is in previous positions, is collision" True (M.isCollision (4,4) [(4,4)]))
isNotCollisionTest = TestCase (assertEqual "Given a position that is NOT in previous positions, is NOT collision" False (M.isCollision (4,3) [(4,4)]))

tests = [
    TestLabel "moveLeftTest" moveLeftTest,
    TestLabel "moveRightTest" moveRightTest,
    TestLabel "moveUpTest" moveUpTest,
    TestLabel "moveDownTest" moveDownTest,
    TestLabel "isCollisionTest" isCollisionTest,
    TestLabel "isNotCollisionTest" isNotCollisionTest]