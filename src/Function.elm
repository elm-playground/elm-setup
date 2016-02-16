module Main (..) where

import Graphics.Element exposing (..)
import Text exposing (..)
import Color exposing (..)
import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)


type alias Ship =
  { position : Float
  , velocity : Float
  , shooting : Bool
  }


greet name =
  "Howdy, " ++ name ++ "!"


diamond color =
  square 100
    |> filled color
    |> rotate (degrees 45)


main =
  -- collage 200 200 [filled blue (square 100)]
  collage 200 200 [ diamond blue ]
