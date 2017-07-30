module Standings.State exposing (initializeModel, subscriptions, update)

import Standings.Rest as Rest
import Standings.Types as Types exposing (League, Model, Msg, Standings)


initializeModel : ( Model, Cmd Msg )
initializeModel =
    ( { standings =
            { league =
                { id = 0
                , name = ""
                }
            , teams = []
            }
      , error = ""
      }
    , Rest.getStandings
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Types.SetStandings (Err _) ->
            ( { model | error = "Could not retrieve standings" }, Cmd.none )

        Types.SetStandings (Ok newStandings) ->
            ( { model | standings = newStandings, error = "" }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
