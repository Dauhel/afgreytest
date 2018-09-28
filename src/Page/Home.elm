module Page.Home exposing (Model, Msg, init, update, view)

import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (src)
import PageSkeleton



-- MODEL


type alias Model =
    { message : String
    }


init : ( Model, Cmd Msg )
init =
    ( { message = "" }, Cmd.none )



-- VIEW


view : Model -> PageSkeleton.Details Msg
view model =
    { title = "Solarlinx Home"
    , content = viewContent
    }


viewContent : Html msg
viewContent =
    div []
        [ img [ src "/logo.svg" ] []
        , h1 [] [ text "Your Elm App is working!" ]
        ]



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )
