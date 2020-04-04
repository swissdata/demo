# swissdata - Machine Readable Public Data

*swissdata* is an attempt to improve machine readibility of publicly available data. The project was born based on our need to make macroeconomic time series more accesible, but it seems extendable to other data sets as well.

## Two Text Files

To keep it as simple as possilbe, we store information in two text files, one file for the *data*, another one for the titles, the sources, the hierarchical strucutre, and all the natural language labels -- the *meta information* (data description).

Because the information is stored in text files only, no special infrastrucutre is needed to disseminate the data: No database, no API Server -- a static URL is sufficient to allow anyone to process your data automatically.

There are two common alternatives to our approach: The first alternative is a single spreadsheet, stored as `.csv` or `.xlsx`. Such a two-dimensional design is badly suited to hold comprehensive, nested hierarchical information, let alone multi-lingual labels. Multi line headers can be used to solve some of these problems, but they are a nightmare for automated processing.

The second alternative is a single file in a format that allows hierarchical data such as `.json` or `.xml`.
Such files can be processed automatically, but are hard to read and understand for humans, and are hard to manipulate in standard software such as Excel.
Also, tabular data will create a lot of redundandcy.

## csv + json = swissdata

We adress these drawbacks by keeping the information in two files:

- We keep the **data** in their most simple, most intuitive, most accesible, non-propietary format -- a simple `.csv` file.

- The **meta information** (data description) gets the most flexible, most cosmopolitan, most accessible, non-propietary format -- a `.json` file.

Time series inside these files are linked through their identifiers.
The following paragraphs take a closer look at these files.

### Data: CSV

Consider the following example of estimates of the Swiss GDP, originally published by the State Secretariat of Economic Affairs (SECO), `ch_seco_gdp.csv`:  FIXME adjust/change example

```
structure,type,seas_adj,date,value
gdp,nom,csa,1980-01-01,48861.3058246375
gdp,nom,csa,1980-04-01,49415.3500513887
gdp,nom,csa,1980-07-01,50142.2214011581
...
gdp,nom,nsa,1980-01-01,47962.720051
gdp,nom,nsa,1980-04-01,49769.717230
gdp,nom,nsa,1980-07-01,50561.590896
```

The `.csv` file contains the following column as indicated by its first line (header):

1. **key** columns: `structure`, `type`, `seas_adj`,
2. **date** column: `YYYY-mm-dd` formated date.
3. **value** column.

Each combination of key columns uniquely identifies a timeseries within the `.csv` file. The combination of all key columns and the date results in a **composite primary key** that identifies an observation.
All headers and key parts must be lowercase, ASCII only and may not contain spaces.

A long format offers the following advantages over a wider structure, particularly for use with time series data:

1. Series can be of different length, without the need for missing values.

2. Series can be of different frequencies, e.g., quarterly and monthly, in the same file.


### Meta Infromation: JSON

The meta information (data description) is stored in a hierachical [JSON](https://www.json.org/json-en.html) structure. It contains:

- general information on the data set, such as title, source and details.

- information on hierarchical structure (e.g., private consumption is part of GDP)

- all labels in arbitrary languages

- a time stamp of the last update. To check if new data are available, it is sufficient to download and inspect the JSON file.

Most modern web browsers provide a user friendly visualization of the .json structure.

Note also, that mapping modular parts of the meta information (dimensions) to their labels has two major advantages over 2-dimensional data formats:

1. No repetitive missing values needed, when information is missing, e.g., some description is not fully translated to every language.

2. Meta information is not stored redundantly alongside every data record.

The below snippet shows a glimpse of this structure.

<!-- FIXME: don't think it is useful to show parts of the JSON, it only makes -->

```json

...

"type": {
//  ...
    "nom": {
      "en": "Nominal",
      "de": "Nominal",
      "fr": "Valeurs nominales",
      "it": "Valori nominali"
    },
    "real": {
      "en": "Real",
      "de": "Real",
      "fr": "Valeurs réelles",
      "it": "Valori reali"
    }
//  ...
}


```





## Code Example: Processing Data with R

TODO: insert short description of the R snippet does, link to file R file at the root of the demo repo.



## Live Examples - Projects That Use the swissdata Format

The following projects use the swissdata framework and format to source data.

- [dataseries.org - Switzerland's data series in one place](http://www.dataseries.org/)
- [SECO's GDP Estimates - published as swissdata format]()

## Publish Your Datasets in the Swiss Data Format

Are you data provider and consider publishing your data in machine readable fashion? **contact us**.
We can help you to turn your data into a machine readable dataset that can be processed in fully automated fashion.

And remember, swissdata happily lives along other publication formats that might be more suitable for humans to read.
You can very well publish swissdata compliant data alongside existing publications.

## Feedback
Do you have feedback or suggestions on how to improve *swissdata* ?

## About

Swissdata is an independent project by @christophsax and @mbannert.
