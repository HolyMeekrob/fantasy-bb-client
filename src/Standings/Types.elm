module Standings.Types exposing (..)

import Http


type alias Model =
    { standings : Standings
    , error : Maybe String
    }


type alias Standings =
    { league : League
    , teams : List Team
    }


type alias League =
    { id : Int
    , name : String
    }


type alias Team =
    { id : String
    , name : String
    , points : Int
    , activePlayers : Int
    }


type Msg
    = SetStandings (Result Http.Error Standings)
