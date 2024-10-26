type
  Point*[T] = object
    x*, y*: T
  Line*[T] = object
    a*, b*: Point[T]
  Triangle*[T] = object
    a*, b*, c*: Point[T]

proc point*[T](x, y: T): Point[T] {.inline.} =
  Point[T](x: x, y: y)

proc line*[T](a, b: Point[T]): Line[T] {.inline.} =
  Line[T](a: a, b: b)

proc triangle*[T](a, b, c: Point[T]): Triangle[T] {.inline.} =
  Triangle[T](a: a, b: b, c: c)
