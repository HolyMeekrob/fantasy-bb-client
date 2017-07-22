module Standings.Types exposing (..)

import Header.Types
import Http


type alias Model =
    { standings : Standings
    , header : Header.Types.Model
    , error : String
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
    , url : String
    }


type Msg
    = SetStandings (Result Http.Error Standings)
