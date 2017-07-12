module Header.Types exposing (..)


type alias Model =
    { user : User
    }


type Msg
    = NoOp


type alias User =
    { firstName : String
    , lastName : String
    , email : String
    }
