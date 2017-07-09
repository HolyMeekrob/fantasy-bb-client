module State exposing (init, update, subscriptions)

import Types exposing (..)

init : (Model, Cmd Msg)
init =
  (
    { name = "Fantasy Big Brother League"
    }
    , Cmd.none
  )

update : Msg -> Model -> (Model, Cmd Msg)
update action model =
  case action of
    Name newName ->
      ( { model | name = newName }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
