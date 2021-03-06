module Paths_simpleIO (
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
libdir     = "/home/nicolas/.cabal/lib/simpleIO-0.1.0.0/ghc-7.6.3"
datadir    = "/home/nicolas/.cabal/share/simpleIO-0.1.0.0"
libexecdir = "/home/nicolas/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "simpleIO_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "simpleIO_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "simpleIO_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "simpleIO_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
