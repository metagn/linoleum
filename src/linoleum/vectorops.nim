import ./common

proc `+`*[T](a, b: Point[T]): Point[T] {.inline.} =
  point(a.x + b.x, a.y + b.y)

proc `-`*[T](a, b: Point[T]): Point[T] {.inline.} =
  point(a.x - b.x, a.y - b.y)

proc `-`*[T](a: Point[T]): Point[T] {.inline.} =
  point(-a.x, -a.y)

proc `*`*[T](a: T, b: Point[T]): Point[T] {.inline.} =
  point(a * b.x, a * b.y)

proc `*`*[T](a: Point[T], b: T): Point[T] {.inline.} =
  point(a.x * b, a.y * b)

proc `+=`*[T](a: var Point[T], b: Point[T]) {.inline.} =
  a.x += b.x
  a.y += b.y

proc `-=`*[T](a: var Point[T], b: Point[T]) {.inline.} =
  a.x -= b.x
  a.y -= b.y

proc `+`*[T](a, b: Line[T]): Line[T] {.inline.} =
  line(a.a + b.a, a.b + b.b)

proc `-`*[T](a, b: Line[T]): Line[T] {.inline.} =
  line(a.a - b.a, a.b - b.b)

proc `+=`*[T](a: var Line[T], b: Line[T]) {.inline.} =
  a.a += b.a
  a.b += b.b

proc `-=`*[T](a: var Line[T], b: Line[T]) {.inline.} =
  a.a -= b.a
  a.b -= b.b

proc dot*[T](a, b: Point[T]): T {.inline.} =
  a.x * b.x + a.y * b.y
