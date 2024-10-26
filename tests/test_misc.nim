when (compiles do: import nimbleutils/bridge):
  import nimbleutils/bridge
else:
  import unittest

import linoleum

test "double triangle square":
  let lowerHalf = triangle(point(0, 0), point(5, 0), point(5, 5))
  let upperHalf = triangle(point(0, 0), point(0, 5), point(5, 5))
  for i in 0 ..< 5:
    for j in 0 ..< i:
      check point(i, j) in lowerHalf
      check point(i, j) notin upperHalf
    check point(i, i) in lowerHalf
    check point(i, i) in upperHalf
    for j in i + 1 ..< 5:
      check point(i, j) notin lowerHalf
      check point(i, j) in upperHalf


