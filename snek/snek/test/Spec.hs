import Test.HUnit
import MovementTest as M
import InputTest as I
import PlayerTest as P
import GameTest as G

main = runTestTT $ TestList (M.tests ++ I.tests ++ P.tests ++ G.tests)