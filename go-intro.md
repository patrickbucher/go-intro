---
title: "Einführung in Go"
subtitle: "Einfache Serveranwendungen entwickeln"
author: "Patrick Bucher"
---

Dieses Dokument dient als Einführung in die Programmiersprache Go. Es richtet
sich an wenig erfahrene Programmierer, die bereits einige Erfahrungen in einer
anderen Programmiersprache wie C#, Java oder JavaScript sammeln konnten. Der
Umgang mit einer aktuellen Version eines Betriebsystems, wie Windows oder
GNU/Linux, sowie mit einem entsprechenden Texteditor und der Kommandozeile, wird
vorausgesetzt.

Dieses Werk untersteht der [Creative Commons CC BY-SA
4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.de)-Lizenz
(Namensnennung - Weitergabe unter gleichen Bedingungen 4.0 International).

![CC-BY-SA 4.0](pics/cc-by-sa.png)\

# Über Go

Go ist eine statisch typisierte Programmiersprache, die zur Entwicklung von
Serveranwendungen geschaffen worden ist. Die Sprache wurde 2007 von Rob Pike
(UTF-8, Plan 9), Ken Thompson (Unix) und Robert Griesemer (einem Thurgauer) bei
Google entwickelt. Die erste stabile Version, Go 1.0, erschien 2009.

## Sprachkonzepte

Go wurde von der Programmiersprache C, der Oberon-Sprachfamilie (Pascal, Modula)
und dem Konzept der _Communicating Sequential Processes_ (CSP) beeinflusst und
vereinigt verschiedene Programmierparadigmen:

- **Strukturierte Programmierung**: Der Programmablauf wird mittels
  Verzweigungen (`if`/`else if`/`else`, `switch`/`case`) und Schleifen (`for`)
  definiert.
- **Funktionale Programmierung**: Funktionen können wie andere Werte in
  Variablen abgespeichert, an Funktionen übergeben und von Funktionen
  zurückgegeben werden (sog. _Closures_).
- **Objektorientierte Programmierung**: Mehrere Variablen können miteinander
  kombiniert (`struct`) und als neue Typen (`type`) definiert werden; für diese 
  Typen können Operationen definiert werden, indem man ihnen Funktionen als
  Methoden anhängt.
- **Nebenläufige Programmierung**: Leichtgewichtige Prozesse, sogenannte
  _Goroutinen_, können nebenläufig ausgeführt und auf mehrere Prozessoren (CPUs)
  verteilt werden. Die Prozesse kommunizieren über _Channels_ miteinander.

## Spracheigenschaften und Vorteile

Weitere Eigenschaften ‒ und damit einhergehende Vorteile ‒ von Go sind:

- Die Sprache ist mit 25 vordefinierten Schlüsselwörtern und einer
  [Spezifikation](https://go.dev/ref/spec) von nur wenigen Seiten sehr schlank
  und gilt daher als einfach zu lernen.
- Der Quellcode wird automatisch und streng nach Vorgaben formatiert, sodass
  Go-Code überall praktisch gleich aussieht und als sehr gut lesbar gilt.
- Go ist eine stark typisierte und kompilierte Programmiersprache. Bei der
  Entwicklung wurde besonders auf schnelle Kompilierungszeiten geachtet, und
  dass man Programme auch für andere Plattformen und Betriebssysteme kompilieren
  kann. Programme werden statisch kompiliert und sind dadurch auf dem Zielsystem
  ohne weitere Abhängigkeiten direkt ausführbar.
- Erweiterungen an der Programmiersprache werden nur sehr selten vorgenommen.
  Dabei wird sichergestellt, dass bestehender Go-Programmcode immer mit neueren
  Versionen von Go kompilierbar ist.
- Das integrierte Werkzeug `go` bietet u.a. Möglichkeiten zum Ausführen,
  Kompilieren und Testen von Programmen, sowie zur Anzeige von Dokumentation und
  zur Verwaltung von Modulen.
- Die Standardbibliothek ist sehr umfangreich und bietet u.a. Pakete für
  HTTP-Server und -Clients, zum Lesen und Schreiben von Bildern, für
  Kryptographie usw.
- Der Arbeitsspeicher wird automatisch verwaltet und per _Garbage Collection_
  freigegeben. Manuelle Speicherverwaltung wie in C ist nicht nötig.
- Go-Programme haben eine recht hohe Ausführungsgeschwindigkeit bei geringem
  Speicherbedarf und lassen sich einfach und sicher auf mehrere Prozessoren
  verteilen, sodass die Kapazitäten moderner Mehrkernsysteme optimal
  ausgeschöpft werden können.

## Kritikpunkte und Nachteile

Go wird v.a. aus folgenden Gründen oft kritisiert:

- Die Fehlerbehandlung erfolgt nicht wie bei Java, C# und JavaScript über
  _Exceptions_, sondern über zusätzliche Rückgabewerte vom Typ `error`, die vom
  Programmierer geprüft werden müssen. Das führt teilweise zu Wiederholungen im
  Code.
- Im Gegensatz zu anderen neueren Sprachen wie Rust, Kotlin und Swift verfügt Go
  über den Wert `nil` (vgl. `null` in C, C++, Java und C# bzw. `None` in Python
  oder `undefined` in JavaScript), der eine häufige Fehlerquelle ist.
- Programme können in Go nur statisch kompiliert werden und werden darum recht
  gross; von ca. 1 MB für ein _Hallo, Welt_-Programm bis zu über 100 MB für
  Infrastrukturanwendungen wie Kubernetes oder Gitea.
- Die Ausführungsgeschwindigkeit von Go-Programmen ist aufgrund des Garbage
  Collectors nicht so hoch wie diejenige von vergleichbaren Programmen, die in
  C, C++ oder Rust geschrieben worden sind.
- Es können nicht alle möglichen Werte als Konstanten definiert werden; oft muss
  man für Sachen, die sich eigentlich nicht ändern sollten, auf Variablen
  zurückgreifen.
- Die Formatierung von Datumswerten erfolgt auf dem vorgegebenen Datumswert
  `2006-01-02 15:04:05 -07:00`, den man sich für die Arbeit mit Datum und Uhrzeit
  also merken muss.

Die folgenden, früher häufig vorgebrachten Kritikpunkte wurden in der
Zwischenzeit durch neuere Versionen von Go gemildert oder entkräftigt:

- Go 1.11 bringt ein sehr solides Modulsystem mit sich.
- Go 1.13 erweitert die Fehlerbehandlung um verschiedene nützliche Funktionen.
- Go 1.18 führt _parametrisierte Polymorphie_ (_«Generics»_) ein, was man
  bereits seit langem von Programmiersprachen wie Java oder C# kennt.

Im Bereich von Serveranwendungen und besonders von Cloud-Infrastruktur-Software
erfreut sich Go höchster Beliebtheit. Software wie Kubernetes, Docker, InfluxDB,
Prometheus, Grafana, Gitea usw. sind grösstenteils in Go geschrieben.

# Hallo, Welt!

Beim Erlernen einer neuen Programmiersprache fängt man traditionellerweise mit
dem sogenannten _Hallo, Welt_-Programm an. Dieser Tradition soll hier gefolgt
werden (`hello_world.go`):

```go
package main

import "fmt"

func main() {
	fmt.Println("Hello, World!")
}
```

Das Programm kann mithilfe des `go`-Befehls ausgeführt werden:

    go run hello_world.go

Die sollte die folgende Ausgabe erzeugen:

    Hello, World!

Das Programm kann auch zuerst kompiliert und anschliessend von der Binärdatei
aus gestartet werden:

    go build hello_world.go
    ./hello_world

Wobei wieder die folgende Ausgabe erscheinen sollte:

    Hello, World!

Auch wenn dieses Programm nicht viel macht, enthält das Programm doch recht
viele verschiedene Bestandteile. Diese sollen Zeile für Zeile durchgegangen
werden:

- **`package main`**: Auf der ersten Zeile wird definiert, um welches Package es
  sich handelt. Das Package mit dem Namen `main` bezeichnet ein ausführbares
  Programm.
- **`import "fmt"`**: Diese Zeile importiert ein Modul namens `fmt`
  (ausgesprochen als "fomt"), welches für die formatierte Ausgabe von Text
  verwendet wird.
- **`func main() {`**: Das `func`-Schlüsselwort definiert eine Funktion. Diese
  hat den Namen `main`. Die Funktion mit dem Namen `main` ist der
  Haupteinstiegspunkt in das Programm. Diese Zeile bezeichnet man als den
  _Funktionskopf_. Am Ende der Zeile wird mit der öffnenden geschweiften Klammer
  der Beginn des _Funktionsrumpfs_ bezeichnet. In Go muss die öffnende Klammer
  für einen Block _auf der gleichen Zeile_ wie der Kopf der Funktion stehen.
- **`fmt.Println("Hello, World!")`**: Die `Println`-Funktion des `fmt`-Moduls
  wird aufgerufen. Es wird ein String-Parameter mit dem Wert `"Hello, World!"`
  übergeben. Am Ende der Zeile wird _kein_ Semikolon (`;`) benötigt. Diese eine
  Zeile macht den gesamten Funktionsrumpf von `main` aus.
- **`}`**: Der Funktionsrumpf wird mit einer schliessenden geschweiften Klammer
  geschlossen; die Funktion ist hier zu Ende.
