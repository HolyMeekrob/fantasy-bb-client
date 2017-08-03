module Team.View exposing (view)

import Html exposing (Html, div, h1, h2, table, td, text, tr)
import Team.Types as Types
import Utils.Html exposing (maybeText)


view : Types.Model -> Html msg
view model =
    div
        []
        [ div
            []
            [ maybeText model.error ]
        , div
            []
            [ h1
                []
                [ text model.team.name ]
            , h2
                []
                [ text <| toString model.team.points ++ " points" ]
            , owner model.team.owner
            , roster model.team.roster
            ]
        ]


owner : Types.User -> Html msg
owner user =
    div
        []
        [ text <| "Owner: " ++ userName user ]


roster : List Types.Houseguest -> Html msg
roster houseguests =
    table
        []
    <|
        List.map houseguest <|
            List.sortBy (\guest -> ( .firstName guest, .lastName guest )) houseguests


houseguest : Types.Houseguest -> Html msg
houseguest player =
    tr
        []
        [ td
            []
            [ text <| houseguestName player ]
        , td
            []
            [ text <| toString player.points ++ " points" ]
        , td
            []
            [ text
                (if player.isActive then
                    "Active"
                 else
                    "Inactive"
                )
            ]
        ]


userName : Types.User -> String
userName user =
    user.firstName ++ " \"" ++ user.nickname ++ "\" " ++ user.lastName


houseguestName : Types.Houseguest -> String
houseguestName houseguest =
    houseguest.firstName ++ " " ++ houseguest.lastName
