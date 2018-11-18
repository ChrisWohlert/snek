module RendererTest where
    
import Test.HUnit
import Renderer
import Player


rendersBoardWithPlayers = TestCase (assertEqual "Given a board and 2 players, renders them" 
    [ "-------------------------------------"
    , "|    XXXXX                          |"
    , "|        X                          |"
    , "|        X                          |"
    , "|                         OOOO      |"
    , "|                            O      |"
    , "|                            O      |"
    , "|                            O      |"
    , "|                                   |"
    , "-------------------------------------" ] 
    (render (37, 9) [Player [(5, 1),(6, 1),(7, 1),(8, 1),(9, 1), (9, 2), (9, 3)] 'X', Player [(26, 4),(27, 4),(28, 4),(29, 4),(29, 5), (29, 6), (29, 7)] 'O']))

tests = [
    TestLabel "rendersBoardWithPlayers" rendersBoardWithPlayers]