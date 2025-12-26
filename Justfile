keyboard := "artsey_io"

default:
  @just --list

lint:
  qmk lint -kb {{keyboard}}

lint-watch:
  watchexec -w keyboards/{{keyboard}} just lint
