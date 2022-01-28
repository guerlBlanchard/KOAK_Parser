data Void = Empty deriving (Show)

type Var = String 
type Typ = String 

data Exp a = Lit (Data a) Integer
           | Var (Data a) Var
           | Ann (Data a) (Exp a) Typ
           | Abs (Data a) Var (Exp a)
           | App (Data a) (Exp a) (Exp a)
           | Exp (Data a)
           deriving (Show)

newtype Data a = D a deriving (Show) 

data Anno = Type String deriving (Show)
data AnnoSet = Types [String] deriving (Show)

set = ["String", "Int", "Double"]

none = D Empty

var = Lit none 10
var2 = Lit (D $ Type "entier") 10

var3 = Lit (D $ Types set) 10

collapseType t (Lit (D (Types s)) n) | t `elem` set = Just (Lit (D $ Type t) n)
                                       | otherwise = Nothing
