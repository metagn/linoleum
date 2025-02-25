import ./common

type
  BoundingBox*[T] = object
    xMin*, xMax*: T
    yMin*, yMax*: T

proc boundingBox*[T](line: Line[T]): BoundingBox[T] =
  result = BoundingBox[T]()
  if line.a.x < line.b.x:
    result.xMin = line.a.x
    result.xMax = line.b.x
  else:
    result.xMin = line.b.x
    result.xMax = line.a.x
  if line.a.y < line.b.y:
    result.yMin = line.a.y
    result.yMax = line.b.y
  else:
    result.yMin = line.b.y
    result.yMax = line.a.y

proc contains*[T](rect: BoundingBox[T], point: Point[T]): bool =
  point.x in rect.minX..rect.maxX and point.y in rect.minY..rect.maxY

proc containsColinear*[T](line: Line[T], point: Point[T]): bool {.inline.} =
  point in line.boundingBox

type Orientation* = enum Linear, Clockwise, CounterClockwise

proc orientation*[T](a, b, c: Point[T]): Orientation =
  let val = (b.y - a.y) * (c.x - b.x) - (b.x - a.x) * (c.y - b.y)
  if val == 0:
    result = Linear
  elif val > 0:
    result = Clockwise
  else:
    result = CounterClockwise

proc orientation*[T](tri: Triangle[T]): Orientation =
  orientation(tri.a, tri.b, tri.c)

proc contains*[T](line: Line[T], point: Point[T]): bool {.inline.} =
  orientation(line.a, point, line.b) == Linear and containsColinear(line, point)

proc intersects*[T](a, b: Line[T]): bool =
  let
    o1 = orientation(a.a, a.b, b.a)
    o2 = orientation(a.a, a.b, b.b)
    o3 = orientation(b.a, b.b, a.a)
    o4 = orientation(b.a, b.b, a.b)
  result = (o1 != o2 and o3 != o4) or
    (o1 == Linear and containsColinear(a, b.a)) or
    (o2 == Linear and containsColinear(a, b.b)) or
    (o3 == Linear and containsColinear(b, a.a)) or
    (o4 == Linear and containsColinear(b, a.b))

proc contains*[T](tri: Triangle[T], point: Point[T]): bool =
  let d1 = orientation(point, tri.a, tri.b)
  let d2 = orientation(point, tri.b, tri.c)
  let d3 = orientation(point, tri.c, tri.a)
  let s = {d1, d2, d3}
  result = not (Clockwise in s and CounterClockwise in s)

import ./vectorops

proc minDistanceVector*[T](ln: Line[T], p: Point[T]): Line[T] =
  # from https://en.wikipedia.org/wiki/Distance_from_a_point_to_a_line#/media/File:Distance_from_a_point_to_a_line.svg
  line(p, ln.a - dot(ln.a - p, ln.b - ln.a) * (ln.b - ln.a))
