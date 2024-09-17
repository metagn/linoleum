type
  Point*[T] = object
    x*, y*: T
  Line*[T] = object
    a*, b*: Point[T]
  Rectangle*[T] = object
    xMin*, xMax*: T
    yMin*, yMax*: T

proc point*[T](x, y: T): Point[T] {.inline.} =
  Point[T](x: x, y: y)
