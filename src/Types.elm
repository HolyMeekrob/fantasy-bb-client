module Types exposing (..)

type alias Model =
  { name: String
  }

type Msg
  = Name String
