module Header.State exposing (initialModel, subscriptions, update)

import Header.Types exposing (Model, Msg)


initialModel : Model
initialModel =
    { user =
        { firstName = ""
        , lastName = ""
        , email = ""
        }
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
