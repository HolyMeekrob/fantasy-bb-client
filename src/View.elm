module View exposing (view)

import Header.View
import Html exposing (Html, div, h1, input, table, tbody, td, text, thead, tr)
import Types


view : Types.Model -> Html Types.Msg
view model =
    div
        []
        [ Header.View.view model.header
        , div
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
            [ text team.name ]
        , td
            []
            [ text <| toString team.points ]
        , td
            []
            [ text <| toString team.activePlayers ]
        ]
