Define Type Synomyms

    type String = [Char]

Define new Types

    data Bool = True | False      -- Real definition of Bool
    data Ordering = LT | EQ | GT  -- Real definition of Ordering

Value Constructors

    data Shape = Circle Float | Rectangle Float Float
    area :: Shape -> Float
    area (Circle r) = pi * r^2        -- We pattern match on value constructors
    area (Rectangle l1 l2) = l1 * l2

Records

    data Employee = Employee { name :: String, experienceInYears :: Float } deriving Show
    richard = Employee { name = "Richard", experienceInYears = 7.5 }
    matt = Employee "Matt" 5
    newMatt = matt { experienceInYears = 6 }
