module Standings.Rest exposing (getStandings)

import Http
import Json.Decode exposing (Decoder, int, list, string)
import Json.Decode.Pipeline exposing (decode, required)
import Standings.Types as Types


standingsDecoder : Decoder Types.Standings
standingsDecoder =
    decode Types.Standings
        |> required "league" leagueDecoder
        |> required "teams" (list teamDecoder)


getStandings : Cmd Types.Msg
getStandings =
    let
        url =
            "http://localhost:8081/api/fantasy-bb/standings"
    in
    Http.get url standingsDecoder
        |> Http.send Types.SetStandings


leagueDecoder : Decoder Types.League
leagueDecoder =
    decode Types.League
        |> required "id" int
        |> required "name" string


teamDecoder : Decoder Types.Team
teamDecoder =
    decode Types.Team
        |> required "id" string
        |> required "name" string
        |> required "points" int
        |> required "activePlayers" int
