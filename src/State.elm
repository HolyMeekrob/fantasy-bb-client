module State exposing (init, subscriptions, update)

import Header.State
import Header.Types
import Rest
import Types exposing (League, Model, Msg)


init : ( Model, Cmd Msg )
init =
    let
        ( headerModel, headerMsg ) =
            Header.State.init
    in
    ( { league =
            { id = 0
            , name = ""
            }
      , header = headerModel
      , error = ""
      }
    , Rest.getLeague
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        Types.SetLeague (Err _) ->
            ( { model | error = "Could not retrieve league information" }, Cmd.none )

        Types.SetLeague (Ok newLeague) ->
            ( { model | league = newLeague, error = "" }, Cmd.none )

        Types.SetLeagueName newName ->
            ( { model | league = updateLeagueName model.league newName, error = "" }, Cmd.none )

        Types.SetUserName name ->
            ( { model | header = updateHeader model.header name, error = "" }, Cmd.none )


updateLeagueName : League -> String -> League
updateLeagueName league newName =
    { league | name = newName }


updateHeader : Header.Types.Model -> String -> Header.Types.Model
updateHeader headerModel name =
    { headerModel | user = updateUser headerModel.user name }


updateUser : Header.Types.User -> String -> Header.Types.User
updateUser user name =
    { user | firstName = name }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
