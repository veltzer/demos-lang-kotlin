#!/usr/bin/env python

""" Compile one Kotlin source into a runnable jar, reproducing the Makefile's
`kotlinc <input> -include-runtime -d <output>`. Invoked by the generator as
kotlinc_build.py <input.kt> <output.jar>. """

import os
import subprocess
import sys


def main():
    """ main entry point """
    source, output = sys.argv[1], sys.argv[2]
    os.makedirs(os.path.dirname(output), exist_ok=True)
    sys.exit(subprocess.call(
        ["kotlinc", source, "-include-runtime", "-d", output]))


if __name__ == "__main__":
    main()
