#import "insa-common.typ": insa-school-name
#import "document-template.typ": insa-translate, insa-page-numbering-state, insa-hide-page-counter, insa-show-page-counter

#let insa-cvl-stage-fonts = ("Arial", "Liberation Sans")

#let insa-cvl-stage(
  firstname,
  lastname,
  department,
  year,
  title,
  company,
  company-logo,
  company-tutor,
  company-tutor-function,
  company-city,
  insa-tutor,
  summary-french,
  summary-english,
  illustration,
  thanks-page: none,
  confidential: false,
  omit-outline: false,
  lang: "fr",
  doc
) = {

  let insa-cvl-stage-translations = (
    report: ("fr": "Rapport de stage", "en": "Internship report"),
    academic-year: ("fr": "Année universitaire", "en": "Academic year"),
    confidential: ("fr": "Rapport CONFIDENTIEL", "en": "CONFIDENTIAL report"),
    confidential-mention: ("fr": "Si oui est coché, signature du tuteur entreprise obligatoire", "en": "If yes is checked, signature of company tutor required"),
    YES: ("fr": "OUI", "en": "YES"),
    NO: ("fr": "NON", "en": "NO"),
    company-tutor: ("fr": "Tuteur entreprise", "en": "Training supervisor"),
    insa-tutor: ("fr": "Enseignant référent", "en": "Academic supervisor"),
    thanks-heading: ("fr": "Remerciements", "en": "Special Thanks")
  )

  let insa-cvl-stage-translate(key, lang, placeholders: (:)) = insa-translate(insa-cvl-stage-translations, key, lang, placeholders: placeholders)

  set text(lang: lang, font: insa-cvl-stage-fonts)

  set page("a4", margin:(top: 0cm, left: 0cm, right: 0cm))

  set par(justify: false) // only for the cover

  // used colors
  let blue_name = rgb("0070C0")
  let gray_item = rgb("808080")

  // logo
  place(
    top + left,
    dx: 1.97cm,
    dy: 1.34cm,
    image("assets/cvl/logo.png", width: 8.10cm)
  )

  // personnal data
  place(
    top + left,
    dx: 13.18cm,
    dy: 2.8cm,
    grid(
      align: left,

      text(font: insa-cvl-stage-fonts, weight: "black", fill: blue_name, size: 14pt, firstname),
      v(0.25cm),
      text(font: insa-cvl-stage-fonts, weight: "black", fill: blue_name, size: 12pt, lastname),
      v(0.98cm),
      text(font: insa-cvl-stage-fonts, weight: "bold", size: 14pt, department),
      v(1.17cm),
      text(font: insa-cvl-stage-fonts, size: 12pt, insa-cvl-stage-translate("academic-year", lang)),
      v(0.58cm),
      text(font: insa-cvl-stage-fonts, weight: "bold", size: 14pt, year)
    )
  )

  // confidentiality box
  place(
    top + left,
    dx: 2cm,
    dy: 4.641cm,
    rect(height: 5.19cm, width: 9.02cm, stroke: 0.02cm, inset: 0pt,
    {
      place(
        top + left,
        dx: 0.22cm,
        dy: 0.37cm,
        text(font: insa-cvl-stage-fonts, weight: "bold", size: 12pt)[#underline(insa-cvl-stage-translate("confidential", lang))],
      )
      place(
        top + left,
        dx: 6.19cm,
        dy: 0.28cm,
        grid(
          align: left,
          let black_checkbox = rect(width: 0.39cm, height: 0.39cm),
          let red_checkbox = rect(width: 0.39cm, height: 0.39cm, stroke: red),

          if (confidential != none) {
            if confidential {
              red_checkbox = rect(width: 0.39cm, height: 0.39cm, inset: 0pt, stroke: red, { place(line(start: (0%,0%), end: (100%, 100%), stroke: red)); line(start: (100%,0%), end: (0%, 100%), stroke: red)});
            } else {
              black_checkbox = rect(width: 0.39cm, height: 0.39cm, inset: 0pt, { place(line(start: (0%,0%), end: (100%, 100%))); line(start: (100%,0%), end: (0%, 100%))});
            }
          },
          
          grid( columns: 3, align: left + horizon, black_checkbox, h(0.58cm), text(font: insa-cvl-stage-fonts, size: 11pt, insa-cvl-stage-translate("NO", lang))),
          v(0.29cm),
          grid( columns: 3, align: left + horizon, red_checkbox, h(0.58cm), text(font: insa-cvl-stage-fonts, fill: red, weight: "bold", size: 14pt, insa-cvl-stage-translate("YES", lang))),
        )
      )
      place(
        top + left,
        dy: 1.56cm,
        block(width: 100%, spacing: 0pt)[
          #set align(center)
          #set text(font: insa-cvl-stage-fonts, size: 9pt)
          #insa-cvl-stage-translate("confidential-mention", lang)
        ]
      )
    }),
  )

  // title
  place(
    top + left,
    dy: 11.43cm,
    block(width: 100%, spacing: 0pt)[
      #set align(center)
      #grid(
        align: center,
        text(font: insa-cvl-stage-fonts, weight: "bold", fill: blue_name, size: 14pt, title),
        v(0.60cm),
        text(font: insa-cvl-stage-fonts, weight: "bold", size: 12pt, insa-cvl-stage-translate("report", lang)),
      )
    ]
  )

  // illustration
  place(
    top + left,
    dx: 1.45cm,
    dy: 13.64cm,
    illustration
  )

  // company tutor and insa tutor
  place(
    top + left,
    dx: 15.52cm,
    dy: 16cm,
    grid(
      align: left,

      text(font: insa-cvl-stage-fonts, size: 11pt)[#underline[#insa-cvl-stage-translate("company-tutor", lang)] : ],
      v(0.35cm),
      text(font: insa-cvl-stage-fonts, weight: "bold", size: 12pt, company-tutor),
      v(0.5cm),
      text(font: insa-cvl-stage-fonts, size: 12pt, company-tutor-function),
      v(2.19cm),
      text(font: insa-cvl-stage-fonts, size: 11pt)[#underline[#insa-cvl-stage-translate("insa-tutor", lang)] : ],
      v(0.35cm),
      text(font: insa-cvl-stage-fonts, weight: "bold", size: 12pt, insa-tutor),
    )
  )

  // Company name and city
  place(
    top + left,
    dx: 1.98cm,
    dy: 25.3cm,
    grid(
      align: left,

      text(font: insa-cvl-stage-fonts, weight: "bold", size: 16pt, company),
      v(0.55cm),
      text(font: insa-cvl-stage-fonts, weight: "bold", size: 14pt, company-city)
    )
  )

  // company logo
  place(
    top + left,
    dx: 14.04cm,
    dy: 24.50cm,
    company-logo
  )

  set page(
    "a4",
    margin: (x: 1.75cm, y: 2.5cm),
    footer: context {
      place(
        right + bottom,
        dx: page.margin.at("right") - 0.6cm,
        dy: -0.6cm,
        box(width: 2.34cm, height: 2.34cm, image("assets/footer.png"))
      )
      if insa-page-numbering-state.get() {
        place(
          right + bottom,
          dx: page.margin.at("right") - 0.6cm,
          dy: -0.6cm,
          box(width: 1.15cm, height: 1.15cm, align(center + horizon, text(fill: white, size: 14pt, font: insa-cvl-stage-fonts, weight: "bold", counter(page).display())))
        )
      }
    },)
  
  pagebreak()

  set par(justify: true, first-line-indent: (amount: 1em, all: true), leading: {0.67em})
  set figure(numbering: "1")
  set outline(indent: auto)
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: image): set figure(supplement: "Figure") // par défaut, Typst affiche "Fig."
  show figure.caption: it => [
    #strong[#it.supplement #context it.counter.display(it.numbering)] : #it.body
  ]

  insa-hide-page-counter()
  set text(font: insa-cvl-stage-fonts, weight: "regular", size: 10pt)

  set heading(numbering: "1.1    ")
  show heading.where(level: 1): it => text(size: 18pt, upper(it))
  show heading.where(level: 2): set text(size: 16pt)
  show heading.where(level: 3): set text(size: 15pt)
  show heading.where(level: 4): set text(size: 14pt)

  if thanks-page != none and thanks-page != [] {
    heading(insa-cvl-stage-translate("thanks-heading", lang), numbering: none, outlined: false)
    thanks-page
    pagebreak()
  }

  insa-show-page-counter(current-page: 1)

  if summary-english != none or summary-english != [] or summary-french != none or summary-french != [] {
    if summary-french != none or summary-french {
      heading("Résumé", numbering: none, outlined: false)
      summary-french
    }
    if summary-english != none or summary-english {
      heading("Abstract", numbering: none, outlined: false)
      summary-english
    }
    pagebreak()
  }

  if not omit-outline {
    show outline: set heading(outlined: false)
    outline()
    pagebreak()
  }

  doc

}
