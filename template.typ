#import "letterloom/lib.typ": *

#show: letterloom.with(
  // Sender's contact information (name and address)
  from-name: "[-options['from-name']-]",
  from-address: "[-options['from-address']-]",
  // from-alignment: right,

  // Recipient's contact information (name and address)
  to-name: "[-options['to-name']-]",
  to-address: "[-options['to-address']-]",

  // attn-name: "Attn: Receiver's Name",
  // attn-address: "Attn:",
  // attn-position: "above",

  // Letter date (automatically set to today's date)
  [# if doc.date #]
  date: datetime(
    year: [-doc.date.year-],
    month: [-doc.date.month-],
    day: [-doc.date.day-]
  ).display("[day padding:zero] [month repr:long] [year repr:full]"),
  [# else #]
  date: datetime.today().display("[day padding:zero] [month repr:long] [year repr:full]"),
  [# endif #]

  // Opening greeting
  salutation: "[-options.salutation-]",

  // Letter subject line
  subject: smallcaps(text(weight: "bold")[[-doc.title-]]),

  // Closing phrase
  closing: "[-options.closing-]",

  // List of signatures with their name, optional signature image, title and affiliation
  signatures: (

   (
     [# if options['signature-name'] #]
     name: "[-options['signature-name']-]",
     [# else #]
     name: "[-options['from-name']-]",
     [# endif #]
     [# if options['signature-title'] #]
     title: "[-options['signature-title']-]",
     [# endif #]
     [# if options['signature-affiliation'] #]
     affiliation: "[-options['signature-affiliation']-]",
     [# endif #]
     [# if options['signature-image'] #]
     signature: image(
       "[-options['signature-image']-]",
       [# if options['signature-image-width'] #]
       width: [-options['signature-image-width']-]
       [# endif -#]
     )
     [# endif #]

   ),

  // [# for signatory in options.signatures #]
  //   (
  //     name: "[-signatory.name-]",
  //     // title: "Title",
  //     affiliation: "[-signatory.affiliation-]",
  //     signature: image("[-signatory.signature-]")
  //   ),
  // [# endfor #]

  ),

  // signature-alignment: left,

  // cc: none,
  // cc-label: "cc:",
  // enclosures: none,
  // enclosures-label: "encl:",
  // footer: none,

  // paper-size: "a4",
  // margins: auto,
  // par-leading: 0.8em,
  // par-spacing: 1.8em,
  // number-pages: false,

  // main-font: "Libertinus Serif",
  // main-font-size: 11pt,
  // footer-font: "DejaVu Sans Mono",
  // footer-font-size: 9pt,
  // footnote-font: "Libertinus Serif",
  // footnote-font-size: 7pt,

  // footnote-alignment: left,
  // link-color: blue,
)

[-IMPORTS-]

[-CONTENT-]
