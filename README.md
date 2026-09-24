# MyST letter template

This is a template for writing letters in [myst](https://mystmd.org/), wrapping the [typst letterloom template](https://typst.app/universe/package/letterloom).

![Screenshot of the PDF generated with this typst letter template](https://github.com/stefanv/myst-typst-letterloom/raw/example/thumbnail.png)

The PDF of the above example is [here](https://github.com/stefanv/myst-typst-letterloom/blob/example/letter.pdf).

To use the template, clone this repository, then customize the example in [./example](./example).
[Once the template is published](https://github.com/myst-templates/templates/pull/58), you'll be able to use it independently of this repository as the `letterloom-typst` theme.

## Theme options

Browse [./template.yml](./template.yml) for a list of template
options, and see [./example/letter.md](./example/letter.md) how to use
them.

`letterhead-image` places an image at the top of the first page, flush
with the page edges. Use `letterhead-inset` to move it away from the
edges, and `letterhead-sender-position` to put the sender's address
next to or below it.

`banner-image` is deprecated. It is an alias for `letterhead-image`
that keeps the image inside the page margins.

Letterloom 3 has no signature title field. The template shows
`signature-title` on the line above `signature-affiliation`.

## For theme developers

The `letterloom` directory was populated from https://github.com/nandac/letterloom/tree/v3.0.2/src
