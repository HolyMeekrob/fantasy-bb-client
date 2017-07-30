module View exposing (view)

import Header.View
import Html exposing (Html, div, h1, text)
import Standings.View
import Types


view : Types.Model -> Html Types.Msg
view model =
    case model.page of
        Types.NotFound ->
            notFound model

        Types.Standings ->
            standings model

        Types.Team id ->
            team model


notFound : Types.Model -> Html Types.Msg
notFound model =
    h1
        []
        [ text "Not Found" ]


standings : Types.Model -> Html Types.Msg
standings model =
    div
        []
        [ Header.View.view model.header
        , Standings.View.view model.standings
        ]


team : Types.Model -> Html Types.Msg
team model =
    div
        []
        [ Header.View.view model.header
        , div
            []
            [ h1
                []
                [ text "Team" ]
            ]
        ]
