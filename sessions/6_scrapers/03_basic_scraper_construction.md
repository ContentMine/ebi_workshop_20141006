### Basic scraper construction

A scraperJSON scraper is a JSON file following a predefined format. In this exercise we will learn how to construct a simple scraper.

We will scrape an eLife paper: "[Cryo-EM structure of the Plasmodium falciparum 80S ribosome bound to the anti-protozoan drug emetine](http://elifesciences.org/content/elife/3/e03080.full)".

scraperJSON scrapers are defined as JSON objects, which are similar to dictionaries. They look like this:

```json
{
  "url": "some_url_regular_expression",
  "elements": [
    "element1" {
      "selector": "//selector1"
    } ,
    "element2" {
      "selector": "//selector2"
    }
  ]
}

There can be two keys in the root object:

- ***url*** - a string-form regular expression specifying which URL(s) this scraper targets
- ***elements*** - a dictionary of elements to scrape

Elements are defined as key-value pairs, where the key is a description of the element, and the value is a dictionary of specifiers defining the element and its processing. The most basic allowed keys in the specifier dictionary are:

- ***selector*** - an XPath selector targeting the element to be selected.
- ***attribute*** - a string specifying the attribute to extract from the selected element. **Optional** (omitting this key is equivalent to giving it a value of `text`). In addition to html attributes there are two special attributes allowed:
    - `text` - extracts any plaintext inside the selected element
    - `html` - extracts the inner HTML of the selected element

#### Scraper

Now that we've seen the basic syntax for building a scraper, let's build one targetting our paper.

```json
{
  "url": "elifesciences\\.org",
  "elements": {
    "publisher": {
      "selector": "//meta[@name='citation_publisher']",
      "attribute": "content"
    },
    "journal": {
      "selector": "//meta[@name='citation_journal_title']",
      "attribute": "content"
    },
    "title": {
      "selector": "//meta[@name='citation_title']",
      "attribute": "content"
    },
    "authors": {
      "selector": "//meta[@name='citation_author']",
      "attribute": "content"
    }
  }
}
```

This scraper targets the publisher, journal, title and authors of the paper. Save it to a json file called `elife_example1.json` and use `quickscrape` to run it against the url:

```bash
$ quickscrape --scraper elife_example1.json --url http://elifesciences.org/content/elife/3/e03080.full
```

#### Results

You should now see the following output file:

```
output
├── http_elifesciences.org_content_3_e03080
│   └── results.json
```

If you open it, you'll see something like:

```json
{
  "publisher": {
    "value": [
      "eLife Sciences Publications Limited"
    ]
  },
  "journal": {
    "value": [
      "eLife"
    ]
  },
  "title": {
    "value": [
      "Cryo-EM structure of the Plasmodium falciparum 80S ribosome bound to the anti-protozoan drug emetine"
    ]
  },
  "authors": {
    "value": [
      "Wilson Wong",
      "Xiao-chen Bai",
      "Alan Brown",
      "Israel S Fernandez",
      "Eric Hanssen",
      "Melanie Condron",
      "Yan Hong Tan",
      "Jake Baum",
      "Sjors HW Scheres"
    ]
  }
}
```

Compare the output to the original site - did you capture all the information?

#### Expanding the scraper

You can now expand the scraper yourself. Decide what information you would like to collect from the paper and add elements to capture it. Once you've got a working scraper, try it on another eLife paper. Whether the scraper works across a wide range of pages is a good measure of the robustness of your selectors.
