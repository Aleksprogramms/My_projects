# Informatik 3 (Wintersemester 2024/25)

Dieses Repository stellt die Materialen der Veranstaltungen „Konzepte der Programmierung“ und „Programmierkurs 3“ zur Verfügung. Es dient auch zur Abgabe und Korrektur der Übungsblätter.

## Installation

Installieren Sie [Git](https://git-scm.com/) oder eine geeignete Alternative, und machen Sie sich mit der grundlegenden Funktionalität vertraut. Das Buch [Pro Git](https://git-scm.com/book/en/v2) ist online verfügbar, zum schnellen Einstieg genügt der [Spickzettel von GitHub](training.github.com/downloads/de/github-git-cheat-sheet/).

Erstellen Sie pro Team ein privates Fork dieses Repository und fügen Sie Ihre:n Teampartner:in, falls vorhanden, sowie Ihre:n Tutor:in, Michael Grossniklaus (`michael.grossniklaus`) und Emanuele D'Osualdo (`emanuele.dosualdo`) als **Maintainer** hinzu. Beide Teampartner:innen können sich dann wie folgt ihre lokale Kopie einrichten.
```
git clone https://gitlab.inf.uni-konstanz.de/<vorname.nachname>/info3-2024w
cd info3-2024w
git remote add upstream https://gitlab.inf.uni-konstanz.de/dbis/education/info3-2024w
```
Als Benutzernamen verwenden Sie dabei den Teil Ihrer Uni-Adresse `mail@uni-konstanz.de` vor dem `@`, das Passwort ist das entsprechende. 

## Aktualisieren

Änderungen vom öffentlichen Repository können Sie dann so auf Ihren Fork übernehmen.
```
git fetch upstream
git pull upstream master
git push
```

## Übungsabgabe

Mit den folgendenen Kommandos geben Sie Ihre Lösung zu einer Übung ab.
```
git add <dateiname>
git commit
git push
```

## Lecture notes for PK3

The lecture notes are in the `pk3` folder.
The file formats are either:

- `.md` (Markdown) with optional separate `.hs` Haskell examples, or
- `.lhs` Literate Haskell files

The literate version of the files is essentially written in Markdown,
with the convention that lines starting with `> ` will be interpreted as
continuing with Haskell code that GHC will consider as the code to compile/interpret. All the lines not starting with `> ` are interpreted as comments by GHC.
The `.lhs` files can be loaded in `ghci` directly as any other Haskell file.

With an editor with syntax highlighting you should be able to read
comfortably the files as plain text.

We recommend using the [Fira Code] font for reading the files,
as it contains many math symbols and uses ligatures to display ASCII symbols
nicely.

[Fira Code]: https://github.com/tonsky/FiraCode/

However, sometimes it is nicer to consume the material in other formats.
To convert the files you can use [Pandoc],
which is actually written in Haskell!

A basic way to convert the files:

    # Convert MD -> HTML
    pandoc -f gfm -t html -s -o FILE.html FILE.md

    # Convert LHS -> HTML
    pandoc -f markdown+lhs -t html -s -o FILE.html FILE.lhs

    # Convert LHS -> PDF
    pandoc -f markdown+lhs -t pdf --pdf-engine=lualatex -o FILE.pdf FILE.lhs

For a fancier PDF output, using Fira Code as font:

    pandoc                           # Assuming running from root of repo
      -f markdown+lhs                # from LHS
      -t pdf                         # to PDF
      --pdf-engine=lualatex          # using `lualatex` for unicode support
      -V monofont:"Fira Code Retina" # Fira Code font (Retina variant)
      -V papersize:a4                # A4 paper
      -H lib/preamble.tex            # LaTeX preamble for symbols & style
      pk3/03/pk3-03.lhs              # Input file
      -o pk3-03.pdf                  # Output file


[Pandoc]: https://pandoc.org/