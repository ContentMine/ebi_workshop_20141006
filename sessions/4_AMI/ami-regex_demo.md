# AMI-REGEX

## Overview

[Regular expressions](http://en.wikipedia.org/wiki/Regular_expression) are very powerful tools for matching sub/strings. 
There are various mutants - AMI uses the [Java7 specification](http://docs.oracle.com/javase/7/docs/api/java/util/regex/Pattern.html) 
which is largely POSIX compliant. There are many good interactive tutorials on the web - if you don't know regexes, sit next to a geek 
who does.

## Example

[A Genbank identifer](http://www.ncbi.nlm.nih.gov/Sequin/acc.html) can be expressed as 

Nucleotide:	1 letter + 5 numerals OR 2 letters + 6 numerals
Protein:	3 letters + 5 numerals
WGS:	4 letters + 2 numerals for WGS assembly version + 6-8 numerals
MGA:	5 letters + 7 numerals

Let's take the first two. 

A letter (case-sensitive) is expressed as ``[A-Z]`` and ``[a-z]``, chunked to ``[A-Za-z]``. 
A digit ("numeral") is ``[0-9]`` (or ``\d``)
A count uses curly braces, e.g. {2} (exactly 2) or {2,5} (between 2 and 5 inclusive)
An alternative uses | ("pipe" or "bar")

So Nucleotide is:

([A-Za-z]\d{5}) | ([A-Za-z]{2}\d{6})
 
 and a protein is
 
 [A-Za-z]{3}\d{5}

If this is too general there are subsections with the spec that might be used.

## Running ami-regex

At present the regexes are edited into a file such as regex/species.xml. This allows for better maintenance and more control
(flags can be added). It's also much better where the regex consists of many alternatives (e.g. a list of species or black-list terms).
Here's my ``regex/genbank.xml``

```
<compoundRegex title="regex">
	<regex weight="1.0" url="http://contentmine.org/genbank" fields="genbank" case="required"
	   title="genbank">\W([A-Z]{2}\d{6})\W</regex>
</compoundRegex>
```

The ``case="required"`` means that I require exact case matching. The \W require this to be a word, else I matched 
``>Elias SA</editor><pubdate>2007</pubdate><fpage>2606<`` which flattens to SA20072606.

run it by:

```
ami-regex -i docs/regex/1471-2148-14-70.xml -g regex/genbank.xml 
```

the output looks like:
```
<regex weight="1.0" url="http://contentmine.org/genbank" fields="genbank" case="required" title="genbank">([A-Z]{2}\d{6})</regex>; ([A-Z]{2}\d{6}); [genbank];  
105  [main] DEBUG org.xmlcml.xhtml2stm.visitor.regex.RegexVisitor  - regex container [<regex weight="1.0" url="http://contentmine.org/genbank" fields="genbank" case="required" title="genbank">([A-Z]{2}\d{6})</regex>; ([A-Z]{2}\d{6}); [genbank];  ]
...
307  [main] DEBUG org.xmlcml.xhtml2stm.visitor.regex.RegexVisitor  - Hits: 1
308  [main] DEBUG org.xmlcml.xhtml2stm.visitor.regex.RegexVisitor  - ([A-Z]{2}\d{6}): 21
309  [main] DEBUG org.xmlcml.xhtml2stm.visitable.AbstractVisitable  - creating output file target/1471-2148-14-70.xml/results.xml // <results xmlns="http://www.xml-cml.org/xhtml2stm"><result xmlns="" genbank="SA200726" count="21" /></results>
```
And finds 21 hits in the paper , flattened
to )

## Compound Regexes

When we want many different searches combined we can use multiple ```<regex>``` elements. (Single regexes are impossible to maintain,
yet some run to pages!!). Here is Ross Mounce's compilation
of terms which classify a paper as computational phylogenetics. The weights allow for precision/recal to be combined and varied.

```
<compoundRegex title="phylotree">
	<regex weight="1.0" url="books.google.co.uk/books?isbn=1118017862">ACCTRAN</regex>
	<regex weight="0.5">align.*</regex>
	<regex weight="0.6">apomorph.*</regex>
	<regex weight="0.6">bayesian</regex>
	<regex weight="0.6">bootstrap.*</regex>
	<regex weight="0.8">branch\s+lengths?</regex>
	<regex weight="1.0" url="DOI: 10.1111/j.1096-0031.1994.tb00179.x">Bremer\s+support</regex>
	<regex weight="0.5">cladist.*</regex>
	<regex weight="0.8">consistency\s+ind(?:ex|ices)</regex>
	<regex weight="1.0" url="books.google.co.uk/books?isbn=1118017862">DELTRAN</regex>
	<regex weight="0.4" url="http://datadryad.org/">DRYAD</regex>
	<regex weight="0.8" url="https://www.nescent.org/wg_garli/Main_Page" case="required">GARLI</regex>
	<regex weight="0.5" url="http://www.ncbi.nlm.nih.gov/genbank/">GenBank</regex>
	<regex weight="0.8" url="http://www.cladistics.com/aboutTNT.html">Goloboff</regex>
	<regex weight="0.9" url="Lectures on Mathematics in the Life Sciences (American Mathematical Society) 17: 57–86.">GTR</regex>
	<regex weight="0.5" url="https://en.wikipedia.org/wiki/Willi_Hennig">Hennig</regex>
	<regex weight="0.7">jackknif.*</regex>
	<regex weight="0.5">maximum\s+likelihood</regex>
	<regex weight="0.5">maximum\s+parsimony</regex>
	<regex weight="0.7">character\s+matrix</regex>
	<regex weight="0.7" url="">MEGA</regex>
	<regex weight="1.0" url="">MrBayes</regex>
	<regex weight="0.9" url="">MPT</regex>
	<regex weight="0.8">multistate\s+characters?</regex>
	<regex weight="0.5">neighbou?r\s+join.*</regex>
	<regex weight="0.1">node</regex>
	<regex weight="0.8" url="">nona</regex>
	<regex weight="0.8">ordered\s+characters?</regex>
	<regex weight="0.5">outgroup</regex>
	<regex weight="0.5">parsimon.*</regex>
	<regex weight="1.0" url="http://paup.csit.fsu.edu/" fields="version"
	   title="Phylogenetic Analysis Using Parsimony">PAUP\*?\s*(\d+\.?\d*)</regex>
	<regex weight="0.5" url="">PHYLIP</regex>
	<regex weight="0.2">phylog.*</regex>
	<regex weight="0.8" url="">PHYML</regex>
	<regex weight="1.0" url="">POY</regex>
	<regex weight="1.0" url="">RAxML</regex>
	<regex weight="0.8" url="">Swofford</regex>
	<regex weight="0.9" url="">TBR</regex>
	<regex weight="0.8" url="http://www.cladistics.com/aboutTNT.html">TNT</regex>
	<regex weight="0.6">phylogenetic\s+tree</regex>
	<regex weight="0.8" url="">TreeBASE</regex>
	<regex weight="0.5">unordered\s+characters?</regex>
	<regex weight="1.0" url="">Winclada</regex>
</compoundRegex>
```

A good domain-expert community can create and maintain these much better than many machine-learning approaches. 




