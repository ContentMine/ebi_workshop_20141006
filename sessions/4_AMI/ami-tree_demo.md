Extracting phylogenetic tree data from images with ami-tree
============================

 * You will be provided (electronically) with some freely available articles from a journal called *International Journal of Systematic & Evolutionary Microbiology* (IJSEM). Although technical you should be able to carry out this exercise without any deep scientific knowledge.
 * Work on your own or in pairs.
 * The aim of this exercise is to extract computationally-reusable information from published scientific figures, in this case; phylogenies. The topology, branch lengths & tip labels will all be extracted from the image(s) so they can reused & re-analysed. 

 Background - Phylogenetic Trees
 --------

Phylogenetic tree figures are widely used in scientific papers to demonstrate the evolutionary relationships between the taxa studied. Further detail about these trees can be found on [Wikipedia](http://en.wikipedia.org/wiki/Phylogenetic_tree). 

![example tree from Wikipedia](http://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/NewickExample.svg/500px-NewickExample.svg.png)

A typical tree may have a number of nodes, branches (edges) & tip (leaf) labels. Branches may or may not have specific lengths which if present can be useful information to capture & reuse.

For real examples of published phylogenetic tree figures (and the vast variety of ways in which they can be depcited) see the PLOS ONE phylogeny figure collection on Flickr: www.bit.ly/PLOStrees


## Getting Started

 
 Inside your ContentMine VM, open up a terminal (e.g. right click, select Terminal).
 Type or copy-in & execute this script to make sure everything is up to date:
 ```
 sh /home/workshop/ebi_workshop_20141006/setup/update_contentmine.sh
 ```
 
 Run *ami-tree* with no arguments to see what command-line arguments it accepts, you should see something like:
 
```
$ ami-tree
Tree: 
Extracts trees (e.g. phylogenetic).
Universal options ('-f' is short for '--foo', etc.):
    -i  --input  inputSpec
                 mandatory: filename, directoryName, url, or (coming) identifier (e.g. PMID:12345678)
    -o  --output  outputSpec
                 mandatory: filename, directoryName
    -r  --recursive
                 recurse through directories
    -x  --extensions ext1 [ext2 ...]
                 mandatory if input directory: file extensions (htm, pdf, etc.)

```

Navigate to *~/ebi_workshop_20141006/sessions/4_AMI/phylo_files/phylo-figure-images* and you'll find 44 bitmap figure images (as .png) of phylogenetic trees taken from freely available IJSEM papers. Each file is named after the DOI of the paper from which it came from. The last three digits of the file name indicate which figure it is in the paper, figure 1 = 000, figure 2 = 001 etc...


