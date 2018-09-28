module Route exposing (Route(..), matchers, parseUrl)

import Url
import Url.Parser exposing (Parser, map, oneOf, parse, top, s)


type Route
    = Home
    | Signin
    | Signup


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map Home top
        , map Signin ( s "signin" )
        , map Signup ( s "signup" ) 
        ]


parseUrl : Url.Url -> Maybe Route
parseUrl url =
    parse matchers url
