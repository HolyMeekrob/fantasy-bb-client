module State exposing (init, update, subscriptions)

import Types exposing (Model, Msg)
import Header.Types
import Header.State

init : (Model, Cmd Msg)
init =
    let
        ( headerModel, headerMsg ) = Header.State.init

    in
        (
            { name = "Fantasy Big Brother League"
            , header = headerModel
            }
            , Cmd.none
        )

update : Msg -> Model -> (Model, Cmd Msg)
update action model =
    case action of
        Types.SetLeagueName newName ->
            ( { model | name = newName }, Cmd.none )

        Types.SetUserName name ->
            ( { model | header = updateHeader model.header name }, Cmd.none )

updateHeader : Header.Types.Model -> String -> Header.Types.Model
updateHeader headerModel name =
    { headerModel | user = updateUser headerModel.user name }

updateUser : Header.Types.User -> String -> Header.Types.User
updateUser user name =
    { user | firstName = name }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
