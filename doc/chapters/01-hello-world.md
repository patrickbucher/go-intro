# Hallo, Welt!

Der Tradition, beim Lernen einer neuen Programmiersprache das _Hallo,
Welt!_-Programm zu schreiben, soll hier gefolgt werden (`hello_world.go`):

```go
package main

import "fmt"

func main() {
	fmt.Println("Hello, World!")
}
```

Das Programm kann mithilfe des `go`-Befehls ausgeführt werden:

    go run hello_world.go

Was folgende Ausgabe erzeugen sollte:

    Hello, World!

Das Programm kann auch zuerst kompiliert und anschliessend von der Binärdatei
aus gestartet werden:

    go build hello_world.go
    ./hello_world

Wobei wieder die folgende Ausgabe erscheinen sollte:

    Hello, World!
