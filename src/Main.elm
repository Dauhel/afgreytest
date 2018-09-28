module Main exposing (main)

import Browser exposing (Document)
import Browser.Navigation as Nav
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (src)
import Page.Home as Home
import Page.Signin as Signin
import Page.Signup as Signup
import PageSkeleton
import Route
import Url exposing (Url)



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }



-- MODEL


type alias Model =
    { key : Nav.Key, page : Page }


type Page
    = NotFound {}
    | Home Home.Model
    | Signin Signin.Model
    | Signup Signup.Model


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    changeRouteTo url { key = key, page = NotFound {} }



-- VIEW


view : Model -> Document Msg
view model =
    case model.page of
        NotFound _ ->
            PageSkeleton.view never
                { title = "Page Not Found"
                , content = PageSkeleton.viewNotFound
                }

        Home homeModel ->
            PageSkeleton.view HomeMsg (Home.view homeModel)

        Signin signinModel ->
            PageSkeleton.view SigninMsg (Signin.view signinModel)

        Signup signupModel ->
            PageSkeleton.view SignupMsg (Signup.view signupModel)



-- UPDATE


type Msg
    = Ignored
    | UrlChanged Url
    | LinkClicked Browser.UrlRequest
    | HomeMsg Home.Msg
    | SigninMsg Signin.Msg
    | SignupMsg Signup.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Ignored ->
            ( model, Cmd.none )

        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model
                    , Nav.pushUrl model.key (Url.toString url)
                    )

                Browser.External href ->
                    ( model
                    , Nav.load href
                    )

        UrlChanged url ->
            changeRouteTo url model

        HomeMsg hMsg ->
            case model.page of
                Home hModel ->
                    let
                        ( homeModel, homeMsg ) =
                            Home.update hMsg hModel
                    in
                    ( { model | page = Home homeModel }
                    , Cmd.map HomeMsg homeMsg
                    )

                _ ->
                    ( model, Cmd.none )

        SigninMsg sMsg ->
            case model.page of
                Signin sModel ->
                    let
                        ( signinModel, signinMsg ) =
                            Signin.update sMsg sModel
                    in
                    ( { model | page = Signin signinModel }
                    , Cmd.map SigninMsg signinMsg
                    )

                _ ->
                    ( model, Cmd.none )

        SignupMsg suMsg ->
            case model.page of
                Signup suModel ->
                    let
                        ( signupModel, signupMsg ) =
                            Signup.update suMsg suModel
                    in
                    ( { model | page = Signup signupModel }
                    , Cmd.map SignupMsg signupMsg
                    )

                _ ->
                    ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- ROUTER


changeRouteTo : Url.Url -> Model -> ( Model, Cmd Msg )
changeRouteTo url model =
    case Route.parseUrl url of
        Nothing ->
            ( { model | page = NotFound {} }, Cmd.none )

        Just Route.Home ->
            let
                ( hModel, hCmd ) =
                    Home.init
            in
            ( { model | page = Home hModel }, Cmd.map HomeMsg hCmd )

        Just Route.Signin ->
            let
                ( sModel, hCmd ) =
                    Signin.init
            in
            ( { model | page = Signin sModel }, Cmd.map SigninMsg hCmd )

        Just Route.Signup ->
            let
                ( suModel, suCmd ) =
                    Signup.init
            in
            ( { model | page = Signup suModel }, Cmd.map SignupMsg suCmd )
