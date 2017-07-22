module State exposing (init, subscriptions, update)

import Navigation exposing (Location)
import Routes
import Standings.State
import Types exposing (Model, Msg)


initializeModel : Types.Page -> ( Model, Cmd Msg )
initializeModel page =
    let
        ( initialStandings, msg ) =
            Standings.State.initializeModel
    in
    ( { page = page
      , standings = initialStandings
      }
    , Cmd.map (\x -> Types.StandingsMsg x) msg
    )


init : Location -> ( Model, Cmd Msg )
init location =
    let
        page =
            Routes.route location

        initialModel =
            initializeModel
    in
    initializeModel page


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Types.Navigate location ->
            let
                page =
                    Routes.route location
            in
            navigate page model

        Types.StandingsMsg subaction ->
            let
                ( standingsModel, standingsCmd ) =
                    Standings.State.update subaction model.standings
            in
            ( { model | standings = standingsModel }, Cmd.none )


navigate : Types.Page -> Model -> ( Model, Cmd Msg )
navigate page model =
    ( { model | page = page }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
