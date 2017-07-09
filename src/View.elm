module View exposing (root)

import Types exposing (..)
import Html exposing (Html, div, h1, text)

root : Model -> Html Msg
root model =
  div []
  [ h1 [] [ text model.name ]
  ]