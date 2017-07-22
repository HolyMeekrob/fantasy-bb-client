module View exposing (view)

import Html exposing (Html, h1, text)
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
    Html.div
        []
        [ Standings.View.view model.standings ]


team : Types.Model -> Html Types.Msg
team model =
    h1
        []
        [ text "Team" ]
