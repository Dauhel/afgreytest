module Page.Signup exposing (Model, Msg, init, update, view)

import Auth exposing (Auth)
import Html exposing (..)
import Html.Attributes exposing (..)
import Http
import PageSkeleton



-- MODEL
-- add a model for our form


type alias Model =
    { session : String
    , problems : List Problem
    , form : Form
    }


type alias Form =
    { firstname : String
    , lastname : String
    , email : String
    , password : String
    }


type Problem
    = InvalidEntry ValidatedField String
    | ServerError String


type alias Model =
    { message : String
    }


init : Session -> ( Model, Cmd msg )
init session =
    ( { session = session
      , problems = []
      , form =
            { firstname = ""
            , lastname = ""
            , email = ""
            , password = ""
            }
      }
    , Cmd.none
    )



-- VIEW


view : Model -> PageSkeleton.Details Msg
view model =
    { title = "Solarlinx Signin"
    , content = viewContent
    }


viewContent : Html msg
viewContent =
    div [ class "section section-white section-signup" ]
        [ div [ class "static-image" ]
            [ div [ class "image", attribute "style" "background-image: url('../assets/img/header-4.jpeg')" ]
                []
            , div [ class "container" ]
                [ div [ class "row" ]
                    [ div [ class "col-md-4 col-md-offset-4 text-center" ]
                        [ h2 [ class "text-white" ]
                            [ text "Sign up" ]
                        , div [ class "separator separator-danger" ]
                            [ text "✻" ]
                        , p [ class "description" ]
                            [ text "No credit card required." ]
                        , div [ class "form-group" ]
                            [ input [ class "form-control form-control-plain", placeholder "First Name", type_ "text", value model.firstnameInput, onInput NewFirstnameInput ]
                                []
                            ]
                        , div [ class "form-group" ]
                            [ input [ class "form-control form-control-plain", placeholder "Last Name", type_ "text", value model.lastnameInput, onInput NewLastnameInput ]
                                []
                            ]
                        , div [ class "form-group" ]
                            [ input [ class "form-control form-control-plain", placeholder "Email adress", type_ "email", value model.emailInput, onInput NewEmailInput ]
                                []
                            ]
                        , div [ class "form-group" ]
                            [ input [ class "form-control form-control-plain", placeholder "Password", type_ "password", value model.passwordInput, onInput NewPasswordInput ]
                                []
                            ]
                        , p []
                            [ text "By signing up you agree to"
                            , a [ href "signup.html" ]
                                [ span [ class "text-danger" ]
                                    [ text "Terms of Service" ]
                                ]
                            , text "and"
                            , a [ href "signup.html" ]
                                [ span [ class "text-danger" ]
                                    [ text "Privacy Policy" ]
                                ]
                            ]
                        , div [ class "button-signin" ]
                            [ button [ onClick SignUpFormSubmit ]
                                [ class "btn btn-danger btn-round btn-fill btn-wd" ]
                                [ text "Sign Up" ]
                            ]
                        , p []
                            [ text "Or use an existing "
                            , a [ class "text-danger", href "signin.html" ]
                                [ text "account" ]
                            , text "."
                            ]
                        ]
                    ]
                ]
            ]
        ]

viewForm Form -> Html Msg 
viewForm form =
                        div [ class "form-group" ]
                            [ input [ class "form-control form-control-plain", placeholder "First Name", type_ "text", value model.firstnameInput, onInput NewFirstnameInput ]
                                []
                            ]
                        , div [ class "form-group" ]
                            [ input [ class "form-control form-control-plain", placeholder "Last Name", type_ "text", value model.lastnameInput, onInput NewLastnameInput ]
                                []
                            ]
                        , div [ class "form-group" ]
                            [ input [ class "form-control form-control-plain", placeholder "Email adress", type_ "email", value model.emailInput, onInput NewEmailInput ]
                                []
                            ]
                        , div [ class "form-group" ]
                            [ input [ class "form-control form-control-plain", placeholder "Password", type_ "password", value model.passwordInput, onInput NewPasswordInput ]
                                []
                            ]
                        , div [ class "button-signin" ]
                            [ button [ onClick SignUpFormSubmit ]
                                [ class "btn btn-danger btn-round btn-fill btn-wd" ]
                                [ text "Sign Up" ]
                            ]

-- UPDATE


type Msg
    = NoOp
    | NewFirstnameInput String
    | NewLastnameInput String
    | NewEmailInput String
    | NewPasswordInput String
    | SignUpFormSubmit
    | SignUpRequestResult (Result Http.Error Auth)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )
