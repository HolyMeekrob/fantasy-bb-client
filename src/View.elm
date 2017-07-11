module View exposing (view)

import Types
import Header.View
import Html exposing (Html, div, h1, text, input)
import Html.Attributes exposing (type_, placeholder)
import Html.Events exposing (onInput)

view : Types.Model -> Html Types.Msg
view model =
    div
        []
        [ Header.View.view model.header
        , h1
            []
            [ text model.name
            ]
        , div
            []
            [ input
                [ type_ "text"
                , placeholder "Enter user name"
                , onInput Types.SetUserName
                ]
                []
            ]
        ]
