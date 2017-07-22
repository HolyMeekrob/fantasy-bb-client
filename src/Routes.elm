module Routes exposing (route)

import Navigation exposing (Location)
import Types
import UrlParser exposing ((</>), Parser, map, oneOf, parseHash, s, string, top)


getParser : Parser (Types.Page -> a) a
getParser =
    oneOf
        [ map Types.Standings top
        , map Types.Standings (s "standings")
        , map Types.Team (s "team" </> string)
        ]


route : Location -> Types.Page
route location =
    case parseHash getParser location of
        Just route ->
            route

        Nothing ->
            Types.NotFound
