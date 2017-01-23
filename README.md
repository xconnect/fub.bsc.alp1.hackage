# Hackage - Einfaches Arbeiten mit Cabal und Monaden 

## Cabal (Build Tool)

### Cabal installieren
sudo apt-get install cabal-install
### Cabal updaten
cabal update
### Mit Cabal nach einem Package suchen
cabal list PACKAGENAME

Bsp.: cabal list directory (sucht alle Packages die sich auf "directory" beziehen)

### Package mit Cabal installieren
cabal install PACKAGENAME

---

## Monaden

###Idee

Monaden sind kleine Welten, in die wir unsere Funktionen verpacken. Das besondere an diesen Welten ist, dass sie Zustände haben und mit der "echten" Welt interagieren können. Wir verpacken also quasi unsere funktionale Welt ohne Zustände in eine kleine Box, die in einer Welt mit Zuständen existieren kann.

Der Haken an der Sache ist, dass wir uns in der echten Welt befinden und daher, sobald wir einmal unsere funktionale Welt in eine Echtwelt-Box verpackt haben nie wieder auspacken können... wir befinden uns ja in der "echten" Welt...

Wir können aber unsere funktionale Welt auspacken und direkt wieder in eine andere EchteWelt-Box verpacken (Mondentransformation).

### Alle Monaden haben immer 2 Operationen
(>>=) :: m a -> (a -> m b) -> m b      (neu verpacken/"bind")

return :: a -> m a   (Wert vom Typ a in eine Monade vom Typ a verpacken)

### Eine Monade ist eine Typklasse!
class Monad m where

  (>>=) :: m a -> (a -> m b) -> m b
  
  return :: a -> m a

---

## Beispiele in diesem Repository
- simpleIO (Eine Art "Hello World"-Programm mit Benutzereingabe)
- simpleIObyArgs (Einfaches IO über die Argumente einer ausfühbaren Datei)
- todoListIO (Eine Art ToDo-Liste als Wörterbuch organisiert)
- databaseIO (IO über eine MySQL-Datenbank)
