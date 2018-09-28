module Page.Signin exposing (Model, Msg, init, update, view)

import Html exposing (..)
import Html.Attributes exposing (..)
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
    { title = "Solarlinx Signin"
    , content = viewContent
    }


viewContent : Html msg
viewContent =
    div [ class "section section-signin" ]
        [ div [ class "image-container" ]
            [ div [ class "filter filter-color-black", attribute "style" "background-image: url('../assets/img/header-9.jpeg')" ]
                [ div [ class "col-md-8 col-md-offset-1" ]
                    [ div [ class "content" ]
                        [ div [ class "title-area" ]
                            [ h1 [ class "title-modern" ]
                                [ text "SOLARLINX" ]
                            , h3 []
                                [ text "Premium Bootstrap Template" ]
                            ]
                        , h5 [ class "subtitle" ]
                            [ text "First Feature" ]
                        , p []
                            [ text "Ultralight Prayer: Happy Easter! In Roman times the artist would contemplate proportions and colors. Now there is only one important color...                            " ]
                        , h5 [ class "subtitle" ]
                            [ text "Second Feature" ]
                        , p []
                            [ text "We no longer have to be scared of the truth I promise I will never let the people down. I want a better life for all!                            " ]
                        , h5 [ class "subtitle" ]
                            [ text "Third Feature" ]
                        , p []
                            [ text "WI have a dream. That dreams will actualize. Dreams will manifest. When companies doubt me they doubt us.                            " ]
                        ]
                    ]
                ]
            ]
        , div [ class "form-container" ]
            [ div [ class "col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1 text-center" ]
                [ div [ class "title-area" ]
                    [ h2 []
                        [ text "Welcome" ]
                    , div [ class "separator separator-danger" ]
                        [ text "✻" ]
                    ]
                , label []
                    [ h4 [ class "text-gray" ]
                        [ text "Your email" ]
                    ]
                , div [ class "form-group" ]
                    [ input [ class "form-control form-control-plain", name "email", placeholder "MichaelJordan@gmail.com", type_ "email", value "" ]
                        []
                    ]
                , label []
                    [ h4 [ class "text-gray" ]
                        [ text "Your password" ]
                    ]
                , div [ class "form-group" ]
                    [ input [ class "form-control form-control-plain", name "password", placeholder "●●●●", type_ "password", value "" ]
                        []
                    ]
                , p [ class "text-gray" ]
                    [ text "By signing up you agree to"
                    , br []
                        []
                    , a [ href "signin.html" ]
                        [ text "Terms of Use" ]
                    , text "and "
                    , a [ href "signin.html" ]
                        [ text "Privacy Policy" ]
                    ]
                , div [ class "footer" ]
                    [ button [ class "btn btn-danger btn-round btn-fill btn-wd" ]
                        [ text "Sign In                        " ]
                    , p [ class "text-gray info" ]
                        [ text "Don't have an account? "
                        , a [ href "signup.html" ]
                            [ text "Sign up" ]
                        ]
                    ]
                ]
            ]
        ]



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )
