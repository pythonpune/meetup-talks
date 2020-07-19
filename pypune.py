#!/usr/bin/env python

import click

from utils.newsletter import newsletter


@click.group()
def cli():
    """Python Pune Utils."""
    pass


cli.add_command(newsletter)

if __name__ == "__main__":
    cli()
