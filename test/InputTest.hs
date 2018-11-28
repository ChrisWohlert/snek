module InputTest where

import Test.HUnit
import Input
import Movement as M

getDirectionLeftTest = TestCase (assertEqual "Giving a 'a' return a Left" M.Left (getDirection 'a'))
getDirectionRightTest = TestCase (assertEqual "Giving a 'd' return a Right" M.Right (getDirection 'd'))
getDirectionUpTest = TestCase (assertEqual "Giving a 'w' return a Up" M.Up (getDirection 'w'))
getDirectionDownTest = TestCase (assertEqual "Giving a 's' return a Down" M.Down (getDirection 's'))

tests = [
    TestLabel "getDirectionLeftTest" getDirectionLeftTest,
    TestLabel "getDirectionRightTest" getDirectionRightTest,
    TestLabel "getDirectionUpTest" getDirectionUpTest,
    TestLabel "getDirectionDownTest" getDirectionDownTest]