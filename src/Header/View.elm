module Header.View exposing (view)

import Header.Types exposing (Model, Msg)
import Html exposing (Html, div, h5, text)
import String

view : Model -> Html msg
view model =
    div
        []
        [ h5 [] [ text (greeting model) ]
        ]

greeting : Model -> String
greeting model =
    let
        lastName =
            if model.user.lastName == ""
            then ""
            else " " ++ model.user.lastName

        firstName =
            if model.user.firstName == ""
            then ""
            else ", " ++ model.user.firstName

    in
        String.join "" ["Welcome", firstName, lastName, "!"]
