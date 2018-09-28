module PageSkeleton exposing (Details, view, viewNotFound)

import Browser exposing (Document)
import Html exposing (..)
import Html.Attributes exposing (..)


type alias Details msg =
    { title : String
    , content : Html msg
    }



-- VIEW


view : (a -> msg) -> Details a -> Document msg
view msgConstructor details =
    { title = details.title
    , body =
        [ viewHeader
        , Html.map msgConstructor details.content
        , viewFooter
        ]
    }



-- Not Found


viewNotFound : Html msg
viewNotFound =
    div []
        [ div [ style "font-size" "12em" ] [ text "404" ]
        , div [ style "font-size" "3em" ] [ text "I cannot find this page!" ]
        ]



-- Header


viewHeader : Html msg
viewHeader =
    div [ class "container" ]
        [ div [ class "navbar-header" ]
            [ button
                [ id "menu-toggle"
                , type_ "button"
                , class "navbar-toggle"
                , attribute "data-target" "#example"
                , attribute "data-toggle" "collapse"
                ]
                [ span [ class "sr-only" ]
                    [ text "Toggle navigation" ]
                , span [ class "icon-bar bar1" ]
                    []
                , span [ class "icon-bar bar2" ]
                    []
                , span [ class "icon-bar bar3" ]
                    []
                ]
            , a [ class "navbar-brand", href "#http://www.solarlinx.com" ]
                [ text "SOLARLINX" ]
            ]
        , div [ class "collapse navbar-collapse" ]
            [ ul [ class "nav navbar-nav navbar-right navbar-uppercase" ]
                [ li []
                    [ a [ href "#home" ]
                        [ text "Home" ]
                    ]
                , li []
                    [ a [ href "#listyourbusiness" ]
                        [ text "LIST YOUR Business" ]
                    ]
                , li []
                    [ a [ href "#contact" ]
                        [ text "Contact" ]
                    ]
                , li []
                    [ a [ href "#signin" ]
                        [ text "REGISTER" ]
                    ]
                ]
            ]
        , text "        "
        ]



-- Footer


viewFooter : Html msg
viewFooter =
    footer
        [ class "footer footer-color-black"
        , attribute "data-color" "black"
        ]
        [ div [ class "container" ]
            [ nav [ class "pull-left" ]
                [ ul []
                    [ li []
                        [ a [ href "#home", target "_blank" ]
                            [ text "Home" ]
                        ]
                    , li []
                        [ a [ href "#about", target "_blank" ]
                            [ text "About Us" ]
                        ]
                    , li []
                        [ a [ href "#contact", target "_blank" ]
                            [ text "Contact" ]
                        ]
                    , li []
                        [ a [ href "#events", target "_blank" ]
                            [ text "Events" ]
                        ]
                    ]
                ]
            , div [ class "social-area pull-right" ]
                [ a [ class "btn btn-social btn-facebook btn-simple", href "#facbook" ]
                    [ i [ class "fa fa-facebook-square" ]
                        []
                    ]
                , a [ class "btn btn-social btn-twitter btn-simple", href "#twitter" ]
                    [ i [ class "fa fa-twitter" ]
                        []
                    ]
                , a [ class "btn btn-social btn-pinterest btn-simple", href "#instagram" ]
                    [ i [ class "fa fa-instagram" ]
                        []
                    ]
                ]
            , div [ class "copyright" ]
                [ text "© 2018 Solarlinx " ]
            ]
        ]
