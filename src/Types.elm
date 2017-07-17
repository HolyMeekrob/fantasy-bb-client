module Types exposing (..)

import Header.Types
import Http


type alias Model =
    { league : League
    , header : Header.Types.Model
    , error : String
    }


type alias League =
    { id : Int
    , name : String
    }


type Msg
    = SetLeague (Result Http.Error League)
    | SetLeagueName String
    | SetUserName String
