module Team.Types exposing (..)

import Http


type alias Model =
    { team : Team
    , error : Maybe String
    }


type alias Team =
    { id : String
    , name : String
    }


type Msg
    = SetTeam (Result Http.Error Team)
