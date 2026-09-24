#import "letterloom/lib.typ": *

#set page(paper: "[-options['paper-size']-]")

// Context gives access to the page size, which the banner-image alias needs
#show: body => context letterloom.with(
  paper-size: "[-options['paper-size']-]",

  // letterloom requires every listed field; list only the fields that are set
  required-fields: (
    "from-name", "date", "subject", "signatures",
    [# for f in ['from-address', 'to-name', 'to-address', 'salutation', 'closing'] #]
    [# if options[f] #]"[-f-]",[# endif #]
    [# endfor #]
  ),

  // Sender's contact information (name and address)
  from-name: "[-options['from-name']-]",
  [# if options['from-address'] #]
  from-address: "[-options['from-address']-]",
  [# endif #]
  // from-alignment: right,

  // Recipient's contact information (name and address)
  [# if options['to-name'] #]
  to-name: "[-options['to-name']-]",
  [# endif #]
  [# if options['to-address'] #]
  to-address: "[-options['to-address']-]",
  [# endif #]

  // attn-name: "Attn: Receiver's Name",
  // attn-address: "Attn:",
  // attn-position: "above",

  // Letterhead image on page 1; `banner-image` is a deprecated alias
  [# set lh = options['letterhead-image'] or options['banner-image'] #]
  [# if lh #]
  letterhead: (
    file: read("[-lh-]", encoding: none),
    [# if options['letterhead-width'] #]
    width: [-options['letterhead-width']-],
    [# endif #]
    [# if options['letterhead-height'] #]
    height: [-options['letterhead-height']-],
    [# endif #]
    [# if options['letterhead-inset'] #]
    image-inset: [-options['letterhead-inset']-],
    [# elif not options['letterhead-image'] #]
    // Keep `banner-image` inside the auto page margins, one par-spacing (1.8em at 11pt) above the text
    image-inset: (
      x: calc.min(page.width, page.height) * 2.5 / 21,
      top: calc.min(page.width, page.height) * 2.5 / 21,
      bottom: 19.8pt,
    ),
    [# endif #]
    [# if options['letterhead-alignment'] #]
    image-alignment: [-options['letterhead-alignment']-],
    [# endif #]
    [# if options['letterhead-sender-position'] #]
    sender-position: [-options['letterhead-sender-position']-],
    [# endif #]
    [# if options['letterhead-sender-valign'] #]
    sender-valign: [-options['letterhead-sender-valign']-],
    [# endif #]
    [# if options['letterhead-bottom-gap'] #]
    bottom-gap: [-options['letterhead-bottom-gap']-],
    [# endif #]
  ),
  [# endif -#]

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
  [# if options['salutation'] #]
  salutation: "[-options.salutation-]",
  [# endif #]

  // Letter subject line
  subject: smallcaps(text(weight: "bold")[[-doc.title-]]),

  // Closing phrase
  [# if options['closing'] #]
  closing: "[-options.closing-]",
  [# endif #]

  // List of signatures with their name, optional signature image, title and affiliation
  signatures: (

   (
     [# if options['signature-name'] #]
     name: "[-options['signature-name']-]",
     [# else #]
     name: "[-options['from-name']-]",
     [# endif #]
     // letterloom has no title field; show the title above the affiliation
     [# if options['signature-title'] and options['signature-affiliation'] #]
     affiliation: "[-options['signature-title']-]\n[-options['signature-affiliation']-]",
     [# elif options['signature-title'] or options['signature-affiliation'] #]
     affiliation: "[-options['signature-title'] or options['signature-affiliation']-]",
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
  // date-alignment: right,

  // cc: none,
  // cc-label: "cc:",
  // enclosures: none,
  // enclosures-label: "encl:",
  // footer: none,

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
)(body)

[-IMPORTS-]

[-CONTENT-]
