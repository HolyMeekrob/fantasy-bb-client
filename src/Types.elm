module Types exposing (..)

import Header.Types
import Navigation exposing (Location)
import Standings.Types


type alias Model =
    { header : Header.Types.Model
    , page : Page
    , standings : Standings.Types.Model
    }


type Page
    = NotFound
    | Standings
    | Team String


type Msg
    = Navigate Location
    | StandingsMsg Standings.Types.Msg
