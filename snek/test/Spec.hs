import Test.HUnit
import MovementTest as M
import InputTest as I
import PlayerTest as P
import RendererTest as R

main = runTestTT $ TestList (M.tests ++ I.tests ++ P.tests ++ R.tests)