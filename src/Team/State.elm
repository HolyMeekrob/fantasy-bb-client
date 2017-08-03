module Team.State exposing (initialCommand, initialModel, subscriptions, update)

import Http
import Team.Rest as Rest
import Team.Types as Types exposing (Model, Msg)


initialModel : Model
initialModel =
    { team =
        { id = ""
        , name = ""
        , points = 0
        , owner =
            { id = ""
            , firstName = ""
            , lastName = ""
            , nickname = ""
            }
        , roster = []
        }
    , error = Nothing
    }


initialCommand : String -> Cmd Msg
initialCommand id =
    Rest.getTeam id


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Types.SetTeam (Err err) ->
            handleError err model

        Types.SetTeam (Ok newTeam) ->
            ( { model | team = newTeam, error = Nothing }, Cmd.none )


handleError : Http.Error -> Model -> ( Model, Cmd Msg )
handleError error model =
    let
        errorMsg =
            "Could not retrieve standings. " ++ getErrorMsg error
    in
    ( { model | error = Just errorMsg }, Cmd.none )


getErrorMsg : Http.Error -> String
getErrorMsg error =
    case error of
        Http.BadUrl url ->
            "Bad URL: " ++ url

        Http.Timeout ->
            "Timeout."

        Http.NetworkError ->
            "Network error."

        Http.BadStatus response ->
            let
                status =
                    response.status
            in
            "Status code: " ++ toString status.code ++ " - " ++ status.message

        Http.BadPayload msg response ->
            "Decode error (" ++ msg ++ "). Response was: " ++ response.body


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
