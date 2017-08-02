module Utils.Html exposing (..)

import Html exposing (Html, text)


maybeText : Maybe String -> Html msg
maybeText txt =
    case txt of
        Just str ->
            text str

        Nothing ->
            text ""
