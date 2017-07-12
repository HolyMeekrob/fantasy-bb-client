module Header.State exposing (init, subscriptions, update)

import Header.Types exposing (Model, Msg)


init : ( Model, Cmd Msg )
init =
    ( { user =
            { firstName = ""
            , lastName = ""
            , email = ""
            }
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
