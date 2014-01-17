module Network.HaskellNet.POP3.SSL
    ( -- * Establishing connection
      connectPop3SSL
    , connectPop3SSLPort
    ) where

import Network.Socket.Internal (PortNumber)
import Network.HaskellNet.POP3.Connection
import Network.HaskellNet.POP3
import Network.HaskellNet.SSL

connectPop3SSL :: String -> IO POP3Connection
connectPop3SSL hostname = connectPop3SSLPort hostname 995

connectPop3SSLPort :: String -> PortNumber -> IO POP3Connection
connectPop3SSLPort hostname port = connectSSL hostname cfg >>= connectStream
  where cfg = defaultSettingsWithPort port
