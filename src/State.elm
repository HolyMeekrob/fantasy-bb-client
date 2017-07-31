module State exposing (init, subscriptions, update)

import Header.State
import Navigation exposing (Location)
import Routes
import Standings.State
import Team.State
import Types exposing (Model, Msg)


getInitialCommand : Types.Page -> Cmd Msg
getInitialCommand page =
    case page of
        Types.NotFound ->
            Cmd.none

        Types.Standings ->
            Cmd.map Types.StandingsMsg Standings.State.initialCommand

        Types.Team id ->
            Cmd.map Types.TeamMsg <| Team.State.initialCommand id


initializeModel : Types.Page -> ( Model, Cmd Msg )
initializeModel page =
    let
        initialStandings =
            Standings.State.initialModel

        initialTeam =
            Team.State.initialModel
    in
    ( { header = Header.State.initialModel
      , page = page
      , standings = initialStandings
      , team = initialTeam
      }
    , getInitialCommand page
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

        Types.TeamMsg subaction ->
            let
                ( teamModel, teamCmd ) =
                    Team.State.update subaction model.team
            in
            ( { model | team = teamModel }, Cmd.none )


navigate : Types.Page -> Model -> ( Model, Cmd Msg )
navigate page model =
    ( { model | page = page }, getInitialCommand page )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
