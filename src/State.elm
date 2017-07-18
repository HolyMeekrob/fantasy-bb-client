module State exposing (init, subscriptions, update)

import Header.State
import Header.Types
import Rest
import Types exposing (League, Model, Msg, Standings)


init : ( Model, Cmd Msg )
init =
    let
        ( headerModel, headerMsg ) =
            Header.State.init
    in
    ( { standings =
            { league =
                { id = 0
                , name = ""
                }
            , teams = []
            }
      , header = headerModel
      , error = ""
      }
    , Rest.getStandings
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        Types.SetStandings (Err _) ->
            ( { model | error = "Could not retrieve standings" }, Cmd.none )

        Types.SetStandings (Ok newStandings) ->
            ( { model | standings = newStandings, error = "" }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
