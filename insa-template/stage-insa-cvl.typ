#let insa-cvl-stage(
  name,
  lastname,
  department,
  year,
  title,
  type,
  company,
  company-logo,
  company-tutor,
  company-tutor-type,
  company-tutor-function,
  company-city,
  insa-tutor,
  summary-french,
  summary-english,
  illustration,
  confidential: false,
  omit-outline: false,
  lang: "fr",
  footer: [],
  doc
) = {
  //set document(author: metadata-authors, date: metadata-date, title: metadata-title)

  //set text(lang: lang, font: heading-fonts)
  set page("a4", margin:(top: 0cm, left: 0cm, right: 0cm), footer: block(width: 100%, {
    set align(center)
    block(width: 77%, footer)
  } ))

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

      text(font: "Arial", weight: "black", fill: blue_name, size: 14pt, name),
      v(0.25cm),
      text(font: "Arial", weight: "black", fill: blue_name, size: 12pt, lastname),
      v(0.98cm),
      text(font: "Arial", weight: "bold", size: 14pt, department),
      v(1.17cm),
      text(font: "Arial", size: 12pt, "Année universitaire"), // TODO: change to use translations
      v(0.58cm),
      text(font: "Arial", weight: "bold", size: 14pt, year)
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
        text(font: "Arial", weight: "bold", size: 12pt)[#underline[Rapport CONFIDENTIEL]],
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
          
          grid( columns: 3, align: left + horizon, black_checkbox, h(0.58cm), text(font: "Arial", size: 11pt, "NON")),
          v(0.29cm),
          grid( columns: 3, align: left + horizon, red_checkbox, h(0.58cm), text(font: "Arial", fill: red, weight: "bold", size: 14pt, "OUI")),
        )
      )
      place(
        top + left,
        dy: 1.56cm,
        block(width: 100%, spacing: 0pt)[
          #set align(center)
          #set text(font: "Arial", size: 9pt)
          Si oui est coché, signature du tuteur entreprise obligatoire
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
        text(font: "Arial", weight: "bold", fill: blue_name, size: 14pt, title),
        v(0.60cm),
        text(font: "Arial", weight: "bold", size: 12pt, type),
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

      text(font: "Arial", size: 11pt)[#underline[Tuteur #company-tutor-type] : ],
      v(0.35cm),
      text(font: "Arial", weight: "bold", size: 12pt, company-tutor),
      v(0.5cm),
      text(font: "Arial", size: 12pt, company-tutor-function),
      v(2.19cm),
      text(font: "Arial", size: 11pt)[#underline[Enseignant référent] : ],
      v(0.35cm),
      text(font: "Arial", weight: "bold", size: 12pt, insa-tutor),
    )
  )

  // Company name and city
  place(
    top + left,
    dx: 1.98cm,
    dy: 25.3cm,
    grid(
      align: left,

      text(font: "Arial", weight: "bold", size: 16pt, company),
      v(0.55cm),
      text(font: "Arial", weight: "bold", size: 14pt, company-city)
    )
  )

  // company logo
  place(
    top + left,
    dx: 14.04cm,
    dy: 24.50cm,
    company-logo
  )

  set page("a4", margin: auto, footer: footer)
  pagebreak()
  doc

}
