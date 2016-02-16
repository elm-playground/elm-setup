
import Graphics.Element exposing (..)
import Time exposing (..)
import Keyboard

type alias Ship =
    { position: Float
    , velocity: Float
    , shooting: Bool }

initShip : Ship
initShip =
    { position = 0
    , velocity = 0
    , shooting = False }

applyPhysics: Float -> Ship -> Ship
applyPhysics dt ship =
    { ship | position = ship.position + ship.velocity * dt }

updateVelocity : Float -> Ship -> Ship
updateVelocity newVelocity ship =
    { ship | velocity = newVelocity }

updateShooting: Bool -> Ship -> Ship
updateShooting isShooting ship =
    { ship | shooting = isShooting }

-- represents pressing the arrow buttons
-- x and y go from -1 to 1, and stay at 0 if nothing is pressed
type alias Keys = { x : Int, y : Int }

update : Float -> Keys -> Ship -> Ship
update dt keys ship =
  let newVel      = toFloat keys.x  -- `let` defines local variables for `in`
      isShooting  = keys.y > 0
  in  updateVelocity newVel (updateShooting isShooting (applyPhysics dt ship))

inputSignal : Signal (Float, Keys)
inputSignal =
  let delta = fps 30
      -- map the two signals into a tuple signal
      tuples = Signal.map2 (,) delta Keyboard.arrows
  -- and update `inputSignal` whenever `delta` changes
  in  Signal.sampleOn delta tuples

dt = 100
keys = { x = -1, y = 1}

summed = List.foldl (+) 0 [1,2,3,4,5]

main: Signal Element
main = Signal.map show (Signal.foldp update initShip inputSignal)
