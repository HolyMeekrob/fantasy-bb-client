module Standings.State exposing (initialCommand, initialModel, subscriptions, update)

import Standings.Rest as Rest
import Standings.Types as Types exposing (League, Model, Msg, Standings)


initialModel : Model
initialModel =
    { standings =
        { league =
            { id = 0
            , name = ""
            }
        , teams = []
        }
    , error = Nothing
    }


initialCommand : Cmd Msg
initialCommand =
    Rest.getStandings


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Types.SetStandings (Err _) ->
            ( { model | error = Just "Could not retrieve standings" }, Cmd.none )

        Types.SetStandings (Ok newStandings) ->
            ( { model | standings = newStandings, error = Nothing }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
