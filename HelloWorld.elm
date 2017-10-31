import Html exposing (Html, button, div, text, h2, a)
import Html.Attributes exposing (title, id, href)
import Html.Events exposing (onClick)
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Bootstrap.Button as Button
import Bootstrap.Card as Card

main =
  Html.beginnerProgram { model = model, view = view, update = update }

type Msg = Increment | Decrement

model =
    {quantity = 0
    ,decrementCounter = 0
    ,incrementCounter = 0
    }

update msg model =
  case msg of
    Increment ->
      {model |
        quantity = model.quantity + 1,
        incrementCounter = model.incrementCounter + 1}

    Decrement ->
      { model |
        quantity = model.quantity - 1,
        decrementCounter = model.decrementCounter + 1}

view model =
    Grid.container []
        [ CDN.stylesheet
        , CDN.fontAwesome
        , mainContent model
        ]

mainContent model =
  div []
    [h2 [] [text ("Количество кликов по декременту " ++ (toString model.decrementCounter))]
    , Button.button
        [ Button.onClick Decrement
        , Button.success
        , Button.large
        , Button.attrs [ title "bootstrap кнопка", id "bootstrap-button" ]
        ]
        [ text "-" ]
    , div [] [ text (toString model.quantity) ]
    , button
        [ onClick Increment
        , title "Обычная html кнопка"
        , id "simple-html-button"
        ]
        [ text "+" ]
    , howItWorksSection
    ]

howItWorksSection =
    div []
        [ h2 [] [ text "Что тут происходит:" ]
        , div []
            [ myCard "Счетчик, увеличивающий или уменьшающий значение в зависимости от нажатой кнопки."
            , myCard "Для кнопки декремента используется компонент Button из пакета elm-bootstrap"
            , myCard "Для кнопки инкремента используется обычная HTML кнопка"
            ]
        , a [ href "http://elm-lang.org/" ] [ text "Эта страничка сделана с помощью языка Elm" ]
        ]

myCard content =
    Card.config [ Card.outlinePrimary ]
        |> Card.block []
            [ Card.text [] [ text content ] ]
        |> Card.view