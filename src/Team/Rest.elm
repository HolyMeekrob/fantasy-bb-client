module Team.Rest exposing (getTeam)

import Http
import Json.Decode exposing (Decoder, string)
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
