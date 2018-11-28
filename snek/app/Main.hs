import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT
import Data.IORef
import qualified Game as G
import Input
import Player
import qualified Movement as M
 
main :: IO ()
main = do
  (_progName, _args) <- getArgsAndInitialize
  initialDisplayMode $= [DoubleBuffered]
  _window <- createWindow "snek"
  windowSize $= Size G.getWidth G.getHeight
  players <- newIORef G.getPlayers
  displayCallback $= (display players)
  keyboardMouseCallback $= Just (keyboardMouse players)
  idleCallback $= (refresh _window)
  addTimerCallback 16 (timer players)
  mainLoop
 
display :: IORef [(Player G.Color)] -> DisplayCallback
display players = do
  clear [ ColorBuffer ]
  ps <- get players
  mapM_ renderPlayers $ map (\ (Player pos _ _) -> pos) ps
  swapBuffers
    where
      renderPlayers ps = renderPrimitive LineStrip $ mapM_ (\ position -> vertex $ ((\ (a, b, c) -> Vertex3 a b c) (convert position))) ps
      convert (a, b) = (toGlutFLoat (fromIntegral a / fromIntegral G.getHeight), toGlutFLoat (fromIntegral b / fromIntegral G.getWidth), 0)
      toGlutFLoat a = (a :: GLfloat)
  
keyboardMouse :: IORef [(Player G.Color)] -> KeyboardMouseCallback  
keyboardMouse players _key _state _modifiers _position = 
  let (Char c) = _key
      dir = getDirection c
      isValid = dir `elem` [M.Left, M.Right, M.Up, M.Down]
  in if isValid then players $~! (\ [(Player ps color _), p2] -> [Player ps color dir, p2]) else return ()

refresh window = do
  return $ postRedisplay (Just window)

timer :: IORef [(Player G.Color)] -> IO ()
timer players = do
  modifyIORef' players (\ [p1, p2] -> [movePlayer p1, p2])
  addTimerCallback 16 (timer players)