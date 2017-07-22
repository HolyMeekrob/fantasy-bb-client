module Types exposing (..)

import Navigation exposing (Location)
import Standings.Types


type alias Model =
    { page : Page
    , standings : Standings.Types.Model
    }


type Page
    = NotFound
    | Standings
    | Team String


type Msg
    = Navigate Location
    | StandingsMsg Standings.Types.Msg
