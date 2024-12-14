# Medea

[![Build Status](https://github.com/pyrmont/medea/workflows/build/badge.svg)](https://github.com/pyrmont/medea/actions?query=workflow%3Abuild)

Medea is another JSON encoder and decoder written in Janet, tragically. It can
be used as a library or a CLI utility.

## Installation

To install the CLI tool, run:

```shell
$ jpm install https://github.com/pyrmont/medea
$ medea --help
```

Medea can also be used as a library. Add the dependency to your `project.janet` file:

```janet
(declare-project
  :dependencies ["https://github.com/pyrmont/medea"])
```

## Usage

### Command Line

The `medea` CLI tool can be used like this:

```text
Usage: medea [--output <path>] [--pretty] [--reverse] [<input>]

Another JSON encoder and decoder in Janet, tragically. By default, decodes JSON into Janet.

Parameters:

 input    The <path> for the input file. (Default: stdin)

Options:

 -o, --output <path>    The <path> for the output file. (Default: stdout)
 -p, --pretty           Make the output pretty.
 -r, --reverse          Reverse the polarity and convert from Janet to JSON.

 -h, --help             Show this help message.
 ```

### Library

Documentation for Medea's API is in [api.md][api].

[api]: https://github.com/pyrmont/medea/blob/master/api.md

## Bugs

Found a bug? I'd love to know about it. The best way is to report your bug in
the [Issues][] section on GitHub.

[Issues]: https://github.com/pyrmont/medea/issues

## Licence

Medea is licensed under the MIT Licence. See [LICENSE][] for more details.

[LICENSE]: https://github.com/pyrmont/medea/blob/master/LICENSE
