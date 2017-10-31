import Html exposing (Html, button, div, text, h2)
import Html.Events exposing (onClick)

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
  div []
    [h2 [] [text ("Количество кликов по декременту " ++ (toString model.decrementCounter))]
    ,button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model.quantity) ]
    , button [ onClick Increment ] [ text "+" ]
    ]