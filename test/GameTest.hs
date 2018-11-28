module GameTest where
    
import Test.HUnit
import Player
import Movement as M
import Game

getHeightTest = TestCase (assertEqual "Gives correct height" 600 getHeight)
getWidthTest = TestCase (assertEqual "Gives correct width" 800 getWidth)

getPlayersTest = TestCase (assertEqual "Gives Correct players" [Player [(5,5)] Red M.Right, Player [(595,795)] Green M.Left] getPlayers)

tests = [
    TestLabel "getHeightTest" getHeightTest,
    TestLabel "getWidthTest" getWidthTest,
    TestLabel "getPlayersTest" getPlayersTest]