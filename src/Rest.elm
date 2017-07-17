module Rest exposing (getLeague)

import Http
import Json.Decode exposing (Decoder, field, int, string)
import Json.Decode.Pipeline exposing (decode, required)
import Types


type alias Standings =
    { league : Types.League
    }


standingsDecoder : Decoder Standings
standingsDecoder =
    decode Standings
        |> required "league" leagueDecoder


leagueDecoder : Decoder Types.League
leagueDecoder =
    decode Types.League
        |> required "id" int
        |> required "name" string


getLeague : Cmd Types.Msg
getLeague =
    let
        url =
            "http://localhost:8081/api/fantasy-bb/standings"
    in
    Http.get url standingsDecoder
        |> Http.send (Types.SetLeague << getLeagueResult)



-- getLeague : Int -> Cmd Types.Msg
-- getLeague id =
--     Http.send Types.SetLeague (getLeagueRequest id)


getLeagueResult : Result Http.Error Standings -> Result Http.Error Types.League
getLeagueResult result =
    case result of
        Ok standings ->
            Ok standings.league

        Err error ->
            Err error
