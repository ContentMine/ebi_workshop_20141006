#Architecture for Mining

[Architecture on PMR's blog](http://blogs.ch.cam.ac.uk/pmr/2014/08/11/how-contentmine-org-will-extract-100-million-scientific-facts/)


## Example of textual domain-based extractor (ChemicalTagger)

A powerful achievable extraction technique is Natural Language Processing comabined with domain ontologies. [ChemicalTagger](http://chemicaltagger.ch.cam.ac.uk/) is a shallow parser (Lezan Hawizy, Nico Adams and PMR) coupled to OSCAR. It uses chemistry-specific NLP for phrases in recipes. 

Visit the web page and try the example there. 

Try the atomospheric chemistry example (Hannah Barjat) which additionally uses geotagging.

Now find some chemistry recipes on the web (not easy as most are not Open Source yet). Cut and paste a typical synthesis (omitting the spectra, which we can also do), paste into ChemicalTagger and see how well it does. Poor recall may be due to a different de facto style.

### Extending taggers

We believe it is relatively easy for domain experts to build taggers for other experimental and procedural sciences.

## Example of domain-based image extractor (AMI-POC, animating reactions)

[ami-chem](https://bitbucket.org/petermr/xhtml2stm/wiki/Home). Read and follow links to [the animated reaction](https://bytebucket.org/petermr/xhtml2stm/wiki/animation.svg)



