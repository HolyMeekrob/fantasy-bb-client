module Team.Types exposing (..)

import Http


type alias Model =
    { team : Team
    , error : Maybe String
    }


type alias Team =
    { id : String
    , name : String
    , points : Int
    , owner : User
    , roster : List Houseguest
    }


type alias User =
    { id : String
    , firstName : String
    , lastName : String
    , nickname : String
    }


type alias Houseguest =
    { id : String
    , firstName : String
    , lastName : String
    , points : Int
    , isActive : Bool
    }


type Msg
    = SetTeam (Result Http.Error Team)
