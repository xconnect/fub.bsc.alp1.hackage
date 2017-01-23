module Paths_DatabaseIO (
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
libdir     = "/home/nicolas/.cabal/lib/DatabaseIO-0.1.0.0/ghc-7.6.3"
datadir    = "/home/nicolas/.cabal/share/DatabaseIO-0.1.0.0"
libexecdir = "/home/nicolas/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "DatabaseIO_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "DatabaseIO_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "DatabaseIO_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "DatabaseIO_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
