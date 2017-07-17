module View exposing (view)

import Header.View
import Html exposing (Html, div, h1, input, text)
import Types


view : Types.Model -> Html Types.Msg
view model =
    div
        []
        [ Header.View.view model.header
        , div
            []
            [ text model.error ]
        , h1
            []
            [ text model.league.name
            ]
        ]
