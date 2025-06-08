#import "../insa-template/stage-insa-cvl.typ" : *

#show: doc => insa-cvl-stage(
  "LE JEUNE",
  "Youenn",
  "INFO",
  "2023-2024",
  "Real-time virtual interaction with deformable structure",
  "Sapienza University",
  image("../exemples/logo-example.png", height: 3.28cm, width: 5.76cm, fit: "contain"),
  "VENDITELLI Marilena",
  "Marketing digital",
  "Bourges - 18",
  "COUASNON Bertrand",
  [
    Résumé du stage en français.
  ],
  [
    Abstract of the internship in english.
  ],
  image("../exemples/rome.jpg", height: 10cm, width: 13.5cm, fit: "cover"),
  thanks-page: [
    Merci aux clients fidèles.
  ],
  confidential: false,
  omit-outline: false,
  lang: "fr",
  doc
)

= Introduction
Présentation de l'entreprise, tout ça tout ça.

#pagebreak()
= Travail réalisé
== Première partie
Blabla, citation : @haug-typst, bonjour#footnote("Au revoir")

== Seconde partie
Bleble

#pagebreak()
= Conclusion
Conclusion random

#pagebreak()
#bibliography("bibliography-example.yml")

#pagebreak()
#set heading(numbering: none)
= Annexes