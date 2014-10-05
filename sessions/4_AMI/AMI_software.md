# AMI

## Link to the demo paper [here](https://github.com/Blahah/AMI-diagrams-demo-paper/blob/master/paper.pdf?raw=true)

# Overview

AMI (from "amanuensis") is a large software system for structuring documents, syntactic and semantic transformation, entity extraction, image analysis 
and other transformative and enhancement tasks. It aims to be a low-level Scientific AI, reading and interpreting factual information. It can currently read:

 * PDF
 * XHTML (HTML)
 * SVG
 * PNG and other bitmapped images
 * TXT

It can extract and/or index:

 * chemical names (OSCAR)
 * chemical diagrams (ami-chem)
 * phylogenetic trees (ami-phylo)
 * entities (using regular expressions)
 * species (styling + regex)
 * sequences (not yet released)
 * custom searches (using regex and XPath)


## Architecture

AMI (technical docs start at [XHTML2STM](https://bitbucket.org/petermr/xhtml2stm/wiki/Home) ) is a Java framework which has a [Visitor pattern](http://en.wikipedia.org/wiki/Visitor_pattern). (also "plugin"). It is currently instantiated as ``xthml2stm`` soon to be refactored to ``ami``. 

Ami tries to normalize different input types , in particular:

* PDF is normalized to XHTML + SVG + PNG
* PNG is translated to SVG where possible
* structure is added to XML and XHTML

The following plugins are most developed:

* ami-chem - chemistry IN IMAGES.
* ami-tree - phylogenetic trees IN IMAGES.
* ami-regex - hand developed regular expressions MATCHING TEXT.
* ami-species - in STYLED TEXT (from HTML or PDF).

AMI is packaged as xhtml2stm_0.4~SNAPSHOT_all.deb run from the commandline as one of the four commands above. Tutorial examples are given for each of these under 4_AMI

## Related software

The complete MR group software stack also includes OSCAR, OPSIN, ChemicalTagger, and the JUMBO+JUMBOConverter libraries. Here we demonstrate two wrapped examples:

* chemextractor (Mark Williamson). Wraps PDFBox and OSCAR to search for chemical entities in text
* ami(2)-poc (Andy Howlett). Extracts molecules and reactions from diagrams in chemistry-contains papers.

## Caveats

Currently AMI does not classify documents so applying it inappropriately will probably produce much noise (e.g. ami-chem may interpret a hollow square as cyclobutane. A typical PDF may contain 10+ images, and the visitor may try to process all of these. Regular expressions may pick up much noise, so use with care. 

## Future developments

The following are high priorities:

* classifying documents
* classifying figure captions and selecting figures
* sectioning documents

These will primarily be managed through XPath expressions.




 
