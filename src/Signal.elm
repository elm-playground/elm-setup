import Mouse
import Graphics.Element exposing (show, Element)

main : Signal Element
main =
    Signal.map show Mouse.position