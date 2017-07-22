module App exposing (main)

import Navigation
import State
import Types
import View


main : Program Never Types.Model Types.Msg
main =
    Navigation.program Types.Navigate
        { init = State.init
        , update = State.update
        , subscriptions = State.subscriptions
        , view = View.view
        }
