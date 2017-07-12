module Types exposing (..)

import Header.Types


type alias Model =
    { name : String
    , header : Header.Types.Model
    }


type Msg
    = SetLeagueName String
    | SetUserName String
