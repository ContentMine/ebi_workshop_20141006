## Using quickscrape

[quickscrape](http://github.com/ContentMine/quickscrape) is a command-line tool that uses the ContentMine web scraping library, [thresher](http://github.com/ContentMine/thresher). Combined with our [collection of scrapers for journals](http://github.com/ContentMine/journal-scrapers), it allows you to scrape the majority of scientific journal articles on the internet.

In this exercise, we will learn to run quickscrape.

### Exercise

The journal-scrapers collection is already downloaded to your VM, at `~/journal-scrapers`.

We will scrape an eLife paper: "[Cryo-EM structure of the Plasmodium falciparum 80S ribosome bound to the anti-protozoan drug emetine](http://elifesciences.org/content/elife/3/e03080.full)".

To run quickscrape, we simply need to tell it where to find the scraper collection, and what URL we want to scrape. Open up a terminal and run the following:

```bash
$ quickscrape --url http://elifesciences.org/content/elife/3/e03080.full --scraperdir ~/journal-scrapers
```

Quickscrape will automatically select the correct scraper from its collection, download the page, and extract the specified elements, downloading any linked files specified in the scraper definition.

You can examine the results in the `output` directory:

```
output
├── http_elifesciences.org_content_3_e03080
    ├── fulltext.pdf
    ├── fulltext.xml
    └── results.json
```

The file `results.json` contains all the scraped data, while the files `fulltext.xml` and `fulltext.pdf` are linked files that were downloaded and renamed.
