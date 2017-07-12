module View exposing (view)

import Header.View
import Html exposing (Html, div, h1, input, text)
import Html.Attributes exposing (placeholder, type_)
import Html.Events exposing (onInput)
import Types


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
