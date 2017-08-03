module Team.Rest exposing (getTeam)

import Http
import Json.Decode exposing (Decoder, bool, int, list, string)
import Json.Decode.Pipeline exposing (decode, required)
import Team.Types as Types


getTeam : String -> Cmd Types.Msg
getTeam id =
    let
        url =
            "http://localhost:8081/api/fantasy-bb/team/" ++ id
    in
    Http.get url teamDecoder
        |> Http.send Types.SetTeam


teamDecoder : Decoder Types.Team
teamDecoder =
    decode Types.Team
        |> required "id" string
        |> required "name" string
        |> required "points" int
        |> required "owner" userDecoder
        |> required "roster" (list houseguestDecoder)


userDecoder : Decoder Types.User
userDecoder =
    decode Types.User
        |> required "id" string
        |> required "firstName" string
        |> required "lastName" string
        |> required "nickname" string


houseguestDecoder : Decoder Types.Houseguest
houseguestDecoder =
    decode Types.Houseguest
        |> required "id" string
        |> required "firstName" string
        |> required "lastName" string
        |> required "points" int
        |> required "isActive" bool
