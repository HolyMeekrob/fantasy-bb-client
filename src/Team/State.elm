module Team.State exposing (initialCommand, initialModel, subscriptions, update)

import Team.Rest as Rest
import Team.Types as Types exposing (Model, Msg)


initialModel : Model
initialModel =
    { team =
        { id = ""
        , name = ""
        }
    , error = ""
    }


initialCommand : String -> Cmd Msg
initialCommand id =
    Rest.getTeam id


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Types.SetTeam (Err _) ->
            ( { model | error = "Could not retrieve standings" }, Cmd.none )

        Types.SetTeam (Ok newTeam) ->
            ( { model | team = newTeam, error = "" }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
