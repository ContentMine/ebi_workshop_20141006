## Creating selectors

Selectors are specially formatted descriptions that specify one or more elements in a document. In the context of a scraper, they allow us to target a particular part of the page we want to scrape; for example, the title, or license, or abstract of a paper.

Because selectors are an important part of web design, browsers come equipped with tools that help us create them.

In this exercise with will focus on XPath selectors, but there are other kinds including CSS selectors and the Open Annotation standard.

### Exercise

We will make some simple selectors that apply to the PeerJ journal using tools in the web browser.

The article we will use is "[Effect of obesity and exercise on the expression of the novel myokines, Myonectin and Fibronectin type III domain containing 5](https://peerj.com/articles/605/)".

Visit the web page linked above and look at the page.

You should be able to identify the following parts of the page:

- title
- license
- abstract

We will use the browser to create some simple XPath selectors that target these elements.

#### Title

Start by right-clicking on the title of the article - you will see a drop-down menu. Select `Inspect Element`.

![Screenshot of IceWeasel drop-down menu to inspect element](http://rawgithub.com/ContentMine/ebi_workshop_20141006/sessions/6_scrapers/assets/selectors_1.png)

The web inspector panel will open at the bottom of the screen. This panel shows the source code that generates the page you see above. The part of the source code responsible for the title is automatically selected.

![Screenshot of IceWeasel web inspector panel](http://rawgithub.com/ContentMine/ebi_workshop_20141006/sessions/6_scrapers/assets/selectors_1.png)

The code in the web inspector panel shows that this is the source of the title element:

```html
<h1 class="article-title" itemprop="name">Effect of obesity and exercise on the expression of the novel myokines, Myonectin and Fibronectin type III domain containing 5</h1>
```

So, the title is contained in an `<h1>` element (a level-1 header), with a class of `article-title`. The class is a way of labelling elements in an HTML document. In this case, the `article-title` class is unique to this element, so we can use it in our selector to capture the title.

This XPath expression will capture the title:

```xpath
//h1[@class="article-title"]
```

The expression breaks down as follows:

- `//` select all instances of the following element type
- `h1` specifies the `h1` element type
- `[]` adds a subset operation to the selection
- `@class=` includes the condition that the `class` of elements in the selection must be exactly equal to the following text
- `"article-title"` specifies the text that `class` must equal

You can test that this selector works by using the *XPath Checker* Firefox extension. To do this, right-click anywhere on the page and choose `View XPath`. This will bring up a window that lets you enter an XPath expression and see the result of applying the expression to the page. Enter the expression we just built and confirm that it selects only the title.

![Screenshot of IceWeasel XPath Checker extension ](http://rawgithub.com/ContentMine/ebi_workshop_20141006/sessions/6_scrapers/assets/selectors_3.png)

#### License

A useful feature of XPath selectors is that they can be chained. For example:

```xpath
//dl[@class='article-license']//span[@class='license-p']
```

As you can see, the selectors are chained simply by appending one to the other. When the selector is applied, the parts are executed in order, with the result of each selection being used as the context for the next selection.

In the example above, the first part, `//dl[@class='article-license']`, selects a `dl` element with the class of `article-license`. The selected `dl` element then becomes the context, so that when the second part, `//span[@class='license-p']`, is executed, it only looks inside the `dl` element that was originally selected.

This system allows highly specific XPath selectors to be constructed, so that any element in a document can be referred to by at least one unique selector.

In practise, there are usually several different ways to refer to any individual element. When choosing selectors, it is important to choose the most robust selector. A robust selector is one that, if the page layout were to change subtly, would still be able to extract the intended element.

Verify that the selector above correctly extracts the license from the page.

How else could this selector have been constructed to refer to the same element? Explore the tools in the browser - can you build a more robust and a less robust version of the same selector?

#### Abstract

Finally, use what you've learned so far to build a selector for the abstract. Make the selector as robust as possible.
