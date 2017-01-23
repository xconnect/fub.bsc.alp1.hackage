module Paths_simpleIObyArgs (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/nicolas/.cabal/bin"
libdir     = "/home/nicolas/.cabal/lib/simpleIObyArgs-0.1.0.0/ghc-7.6.3"
datadir    = "/home/nicolas/.cabal/share/simpleIObyArgs-0.1.0.0"
libexecdir = "/home/nicolas/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "simpleIObyArgs_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "simpleIObyArgs_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "simpleIObyArgs_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "simpleIObyArgs_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
