import calendar
from datetime import datetime
from pathlib import Path

import click
import requests

TEMPLATE = """
# PythonPune Community Newsletter [{month}-{year} Edition]

## News from Python Community

## New projects

## Upcoming events in & around Pune

<!-- Manually update above sessions (community, new projects, events) with fallowing raw data. -->

{news}

<!-- End raw data. -->

## Thanks

* Thank you <hosts> for hosting {month} PythonPune meetup {year} and
  < name of speakers > for delivering talks.

## Compiled by PythonPune
{contributers}
"""

PROJECT_PATH = Path(".")
MONTHS = [name for name in calendar.month_name]
CURRENT_DATE = datetime.now()
NEWSLETTER_QUARY = "https://api.github.com/search/issues?q=repo:pythonpune/meetup-talks+is:issue+state:open+label:newsletter"


def get_newsletter_data():
    contributers = {}
    news = []

    req = requests.get(NEWSLETTER_QUARY)
    assert req.ok
    data = req.json()

    if data["total_count"] != 0:
        comments_url = data["items"][0]["comments_url"]
        comments_req = requests.get(comments_url)
        comments = comments_req.json()

        for comment in comments:
            contributers[comment["user"]["login"]] = comment["user"]["html_url"]
            news.append(f"* {comment['body']}")

    return contributers, news


@click.command(help="Create newsletter event.")
@click.option(
    "-m",
    "--month",
    default=MONTHS[CURRENT_DATE.month],
    type=click.Choice(MONTHS[1:]),
    help="Event Month; default will take current.",
)
@click.option(
    "-y",
    "--year",
    default=CURRENT_DATE.year,
    help="Event Year; default will take current.",
)
def newsletter(month, year):
    contributers, news = get_newsletter_data()

    if news and contributers:
        news = "\n \n".join(news)
        contributers = "\n".join(
            [f"* [{name}]({link})" for name, link in contributers.items()]
        )
        compiled_template = TEMPLATE.format(
            month=month, year=year, news=news, contributers=contributers
        )
    else:
        click.echo(
            "Newsletter Not Found: Confirm newsletter issue open with label:newsletter."
        )
        exit(1)

    event_dir = PROJECT_PATH / str(year) / month
    event_dir.mkdir(exist_ok=True, parents=True)

    with open(event_dir / "community_news.md", "w") as f:
        f.write(compiled_template)
