module Standings.View exposing (view)

import Html exposing (Html, a, div, h1, input, table, tbody, td, text, thead, tr)
import Html.Attributes exposing (href)
import Standings.Types as Types


view : Types.Model -> Html msg
view model =
    div
        []
        [ div
            []
            [ text model.error ]
        , div
            []
            [ h1
                []
                [ text model.standings.league.name
                ]
            , div
                []
                [ leagueStandings <| List.reverse <| List.sortBy .points model.standings.teams
                ]
            ]
        ]


leagueStandings : List Types.Team -> Html msg
leagueStandings teams =
    table
        []
        [ thead
            []
            [ tr
                []
                [ td
                    []
                    [ text "Team" ]
                , td
                    []
                    [ text "Points" ]
                , td
                    []
                    [ text "Active Players" ]
                ]
            ]
        , tbody
            []
            (List.map teamStandings teams)
        ]


teamStandings : Types.Team -> Html msg
teamStandings team =
    tr
        []
        [ td
            []
            [ a
                [ href <| "#/team/" ++ team.id ]
                [ text team.name ]
            ]
        , td
            []
            [ text <| toString team.points ]
        , td
            []
            [ text <| toString team.activePlayers ]
        ]
