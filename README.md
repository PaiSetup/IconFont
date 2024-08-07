# IconFont
This little repository holds custom *.svg* files used to generate icon font used by *PaiSetup*. The icons are assigned to selected unicode codepoints. They are displayed whenever these codepoints appear in text, allowing *PaiSetup* to use nice icons in GUI elements.

Most of icon glyphs used are contained in *FontAwesome* (`ttf-font-awesome` package). However, *FontAwesome* obviously doesn't have all icons I'd like to have. On top of that, some of the icons are paid. Although I get it, I won't pay for an icon on my private PC, that would be absurd.

Steps to perform whenever new icon glyph has to be added:

1. Create or find *.svg* file for icon. It is possible to convert *.png* to *.svg* with [convertio](https://convertio.co/png-svg/), but it doesn't always work, so it's better to just find *.svg*. [Svgrepo](https://www.svgrepo.com/) has a lot of great free *.svg* files.
2. Prepare the *.svg*:
    - Make sure it doesn't use *stroke* feature. If it does, *icomoon* will ignore elements with *stroke*. Fortunately, it can be converted to *fills* using [iconly](https://iconly.io/tools/svg-convert-stroke-to-fill). Example *stroke* usage:
        ```svg
        <path d="M15.5 15C15.5 16.933 13.933" stroke="currentColor" stroke-width="1.5" />
        ```
    - Make sure it is properly cropped. Sometimes the icon will appear very small, so it has to be "zoomed". This would be best done by some *.svg* editing software like *Inkscape*, but since this is done by an autistic person, let's do it by editing text. [Svgviewer](https://www.svgviewer.dev/) is a nice website that can display *.svg* both in its textual and graphical form. Play with `viewBox` property to crop the *.svg*.
    - Make sure it doesn't use colors, e.g. `svg fill=#903100`. If it does, *icomoon* will display warning about the *.svg* being multicolor. It will not work.
3. Generate *.ttf* file with https://icomoon.app. Unfortunately, there's no easy way to do it locally within a script. Updating this custom font is quite rare, so it's acceptable (not loving it, though...).
    - On the top click "Import icons" and import *.svg* files in this repo.
    - Select the files and go to "Generate font" at the bottom
    - Assign unicode codepoints to the icons

        | Svg                      | Codepoint |
        |--------------------------|-----------|
        | headphones_bluetooth.svg | f8e0      |
        | headphones_wired.svg     | f8e2      |
        | headphones_wireless.svg  | f8e3      |
        | speaker.svg              | f8de      |
        | streaming.svg            | f8df      |
4. Download *.zip* file called `~/downloads/icomoon-v1.0.zip`.
5. Call `extract_ttf.bash`. The script extracts *.ttf* file from the *.zip* file and copies it to this repository.
6. Copy the *.ttf* file to `~/.local/share/fonts`. This step is done automatically by *PaiSetup*.
