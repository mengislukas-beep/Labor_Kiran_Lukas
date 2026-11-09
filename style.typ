// ========================================
// style.typ
// Typst-Style ähnlich zu deinem LaTeX-Paket
// ========================================

// -----------------------------
// Grundlayout
// -----------------------------
#import "@preview/lilaq:0.6.0" as lq
#import "@preview/simple-plot:0.3.0": plot

#let setup(body) = {
  set page(
    paper: "a4",
    margin: (
      top: 2cm,
      left: 2cm,
      right: 2cm,
      bottom: 2.5cm,
    ),
    footer: align(center)[
      #context counter(page).display()
    ],
  )

  set text(
    font: "Libertinus Serif",
    size: 9pt,
    fill: rgb("#222222"),
  )

  set par(
    justify: false,
    leading: 0.65em,
  )

  show par: it => block(
    spacing: 0.9em,
    it,
  )

  set heading(numbering: "1.1.1")
  
  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    it
  }

  set math.equation(numbering: (n) => {
    let chapter = counter(heading).get().first()
    numbering("(1.1)", chapter, n)
  })

  body
}

#show heading.where(level: 1): it => {
  let num = if it.numbering != none { it.numbering + h(0.6em) } else { [] }
  block(
    above: 15pt,
    below: 0pt,
    text(17pt, weight: "bold", fill: rgb("#222222"))[
      #num #it.body
    ],
  )
}

#show heading.where(level: 2): it => {
  let num = if it.numbering != none { it.numbering + h(0.6em) } else { [] }
  block(
    above: 10pt,
    below: 0pt,
    text(14pt, weight: "bold", fill: rgb("#222222"))[
      #num #it.body
    ],
  )
}

#show heading.where(level: 3): it => {
  let num = if it.numbering != none { it.numbering + h(0.6em) } else { [] }
  block(
    above: 5pt,
    below: 0pt,
    text(11pt, weight: "bold", fill: rgb("#222222"))[
      #num #it.body
    ],
  )
}


// -----------------------------
// Listen
// -----------------------------
#set enum(
  numbering: "1.",
  indent: 1.1em,
)

#set list(
  indent: 1.6em,
  body-indent: 0.8em,
)


// -----------------------------
// Titelfunktion
// Entspricht ungefähr \stdtitle
// -----------------------------
#let stdtitle(line1, line2, line3) = {
  align(left)[
    #text(18pt, weight: "bold", fill: rgb("#222222"))[#line1] \
    #text(18pt, weight: "bold", fill: rgb("#222222"))[#line2] \
    #text(14pt, weight: "bold", fill: rgb("#222222"))[#line3]
  ]
  v(10pt)
}


// -----------------------------
// Hilfsfunktionen für Textstil
// -----------------------------
#let titlefont(body) = text(
  font: "Latin Modern Sans",
  weight: "bold",
  fill: rgb("#222222"),
)[#body]

#let dul(body) = underline(underline(body))


// -----------------------------
// Mathe-Makros
// Nutzung: $#R$, $#Hom(V, W)$ usw.
// -----------------------------

// Mengen
#let SET(a, b) = math.lr("{", a + "|" + b, "}")
#let Set(x) = math.lr("{", x, "}")

// Standardräume
#let R = math.bb("R")
#let C = math.bb("C")
#let Q = math.bb("Q")
#let Z = math.bb("Z")
#let N = math.bb("N")
#let S = math.bb("S")

// Operatoren
#let id = math.op("id")
#let Image = math.op("Im")
#let rank = math.op("rank")
#let Hom = math.op("Hom")
#let span = math.op("span")
#let mol = math.op("mol")

// Griechische Kurzformen
#let dlt = math.delta
#let eps = math.epsilon.alt

// Quantoren
#let fa = math.forall
#let ex = math.exists
#let nex = math.exists.not

// Delimiter
#let ceil(x) = math.ceil(x)
#let floor(x) = math.floor(x)
#let abs(x) = math.abs(x)
#let norm(x) = math.norm(x)


// -----------------------------
// Kleine Box für wichtige Hinweise
// optional, aber praktisch
// -----------------------------
#let infobox(body) = block(
  fill: luma(245),
  stroke: 0.6pt + gray,
  inset: 10pt,
  radius: 4pt,
  body,

)

#let ip(x,y) = $chevron.l #x "," #y chevron.r$
#let int = $integral$
#let const ="const."
#let ddot(x) =  $dot.double(#x)$
#let End = "End"
#let Span(x) = $chevron.l #x chevron.r$
#let part = $partial$
#let rot = "rot"
#let div = "div"
#let Nabla = $vec(part/(part x),part/(part y),part/(part z))$
#let sgn = "sgn"
#let diag() = $"diag"(lambda_1,dots,lambda_n)$
#let baar(x) = $abs(abs(#x))$
#let with = "with "
#let Tr = "Tr"
#let quadd = $quad quad$
#let quaddd =$ quadd quadd$
#let total = "total"
#let re = "re"
#let im = "Im"
#let st  = "such that"
#let um = $sum_(i=1)^n$
#let proved = align(right)[$square$]
#let idv = $"id"_V$
#let Sp = "Sp"
#let GL = "GL"
#let ie = "id est"
#let iff = $<=>$
#let pm = $plus.minus$




#let ID = $
mat(1,,0;,dots.down,;0,,1)
$

#let diagonal(..xs) = {
  let xs = xs.pos()
  let n = xs.len()

  math.mat(
    ..range(n).map(i =>
      range(n).map(j =>
        if i == j { xs.at(i) } else {  }
      )
    )
  )
}