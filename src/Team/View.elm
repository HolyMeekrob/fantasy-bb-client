module Team.View exposing (view)

import Html exposing (Html, div, text)
import Team.Types as Types


view : Types.Model -> Html msg
view model =
    div
        []
        [ text model.team.name ]
