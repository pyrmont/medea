# Medea

[![Build Status](https://github.com/pyrmont/medea/workflows/build/badge.svg)](https://github.com/pyrmont/medea/actions?query=workflow%3Abuild)

Medea is another JSON encoder and decoder written in Janet, tragically. It can
be used as a library or a CLI utility.

## Installation

Build the `medea` executable using JPM:

```sh
git clone https://github.com/pyrmont/medea
cd medea
jpm -l run exe-deps
jpm -l build
```

Now copy the `build/medea` executable to a directory on your PATH.

Medea can also be used as a library. Add the dependency to your `project.janet` file:

```janet
(declare-project
  :dependencies ["https://github.com/pyrmont/medea"])
```

## Usage

The `medea` executable can be used like this:

```text
Usage: medea [--output <path>] [--reverse] [<input>]

Another JSON encoder and decoder in Janet, tragically.

Parameters:

 input    The <path> for the input file. (Default: stdin)

Options:

 -o, --output <path>    The <path> for the output file. (Default: stdout)
 -r, --reverse          Reverse the polarity and convert from Janet to JSON.

 -h, --help             Show this help message.
 ```

## Bugs

Found a bug? I'd love to know about it. The best way is to report your bug in
the [Issues][] section on GitHub.

[Issues]: https://github.com/pyrmont/medea/issues

## Licence

Medea is licensed under the MIT Licence. See [LICENSE][] for more details.

[LICENSE]: https://github.com/pyrmont/medea/blob/master/LICENSE
