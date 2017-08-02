module Team.View exposing (view)

import Html exposing (Html, div, text)
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
            [ text model.team.name ]
        ]
