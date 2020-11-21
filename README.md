# PythonPune Meetup Talks

Welcome to meetup repository of PythonPune. This repository contains
details of monthly events conducted as part of this group.

* [Submit a talk](#submit-a-talkworkshop)
* [Monthly newsletter](#monthly-newsletter)
* [Summary of past events](#summary-of-past-events)
* [How to add newsletter and event summary](#how-to-add-newsletter-and-event-summary)
* [Code of Conduct](#code-of-conduct)
* [License](#license)

## Submit a talk/workshop
If you want to submit a talk for upcoming events, then you can [create
a new
issue](https://github.com/pythonpune/meetup-talks/issues/new/choose)
on this repository. Just fill in the requested details and one of us
will take care of scheduling the talk/workshop.

When a talk/workshop proposal is created, it gets labeled with
[`talk-proposal`](https://github.com/pythonpune/meetup-talks/issues?q=label:talk-proposal). Once
it's confirmed and the date is decided,
[`scheduled`](https://github.com/pythonpune/meetup-talks/issues?q=label:scheduled)
label will be added to it.

After the event, the event page will be updated with summary, slides
and code snippets of the talk. Once done, the issue will be closed.

## Monthly newsletter
At the beginning of every month an issue will be created. It will have
'Newsletter Collection Box' in it's name. This issue will have
[`newsletter`](https://github.com/pythonpune/meetup-talks/issues?q=is:issue+label:newsletter)
label on it. Anyone can post links to blog posts, news articles
related to Python on this issue.

All the links will be compiled together and saved as
`community_news.md` in that months directory. It will be presented
during the meetup as well.

## Summary of past events
This is the index of summaries of past events.

<details>
  <summary>2020</summary>

  * [January](./content/2020/January/README.md)
  * [February](./content/2020/February/README.md)
  * [March](./content/2020/March/README.md)
  * [April](./content/2020/April/README.md)
  * [May](./content/2020/May/README.md)
  * [June](./content/2020/June/README.md)
  * [July](./content/2020/July/README.md)
  * [August](./content/2020/August/README.md)
  * [September](./content/2020/September/README.md)
  * [October](./content/2020/October/README.md)
  <!-- * [November](./content/2020/November/README.md) -->
  <!-- * [December](./content/2020/December/README.md) -->
</details>

<details>
  <summary>2019</summary>

  * [January](./content/2019/January/README.md)
  * [February](./content/2019/February/README.md)
  * [March](./content/2019/March/README.md)
  * [April](./content/2019/April/README.md)
  * [May](./content/2019/May/README.md)
  * [June](./content/2019/June/README.md)
  * [July](./content/2019/July/README.md)
  * [August](./content/2019/August/README.md)
  * [September](./content/2019/September/README.md)
  * [October](./content/2019/October/README.md)
  * [November](./content/2019/November/README.md)
  * [December](./content/2019/December/README.md)
</details>

## How to add newsletter and event summary
To add newsletter file (`community_news.md`) or event summary
(`README.md`) for the current month run following commands. Make sure
you have [installed
Hugo](https://gohugo.io/getting-started/installing/ "Hugo docs page:
Install Hugo") and [Go](https://golang.org/doc/install "Go docs page:
Install Go") on your machine.

> **Note**: It will not overwrite the existing files from the directory.

```console
$ make event
Creating summary files in 'content/2020/March'.
mkdir --parents content/2020/March
hugo new content/2020/March/README.md --kind "event"
content/2020/March/README.md created
```

```console
$ make newsletter
Creating newsletter files in 'content/2020/March'.
mkdir --parents content/2020/March
hugo new content/2020/March/community_news.md --kind "newsletter"
content/2020/March/community_news.md created
```

It's possible to generate the files for a specific year and month
combination by setting the value of `DATE_DIR` variable.
```console
$ DATE_DIR="2020/April" make event
Creating summary files in 'content/2020/April'.
mkdir --parents content/2020/April
hugo new content/2020/April/README.md --kind "event"
content/2020/April/README.md created
```

## Code of Conduct
Code of Conduct for [PythonPune meetup
group](https://meetup.com/PythonPune) can be found
[here](./CODE_OF_CONDUCT.md).

## License
This repository is licensed under [Creative Commons
Attribution-ShareAlike 4.0 International (CC BY-SA
4.0)](https://creativecommons.org/licenses/by-sa/4.0/). The slides,
code snippets or any other images in this repository might have a
different license as well as copyright, please check before reusing
the material. See [LICENSE](./LICENSE) for the full license text.
