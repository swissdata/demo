# swissdata - Machine Readable Public Data

*swissdata* is an attempt to improve machine readability of publicly available data. The project was born based on our need to make macroeconomic time series more accessible, but it seems extendable to other datasets as well.

## Two Text Files

To keep it as simple as possible, we keep the information in two text files, one for the *data*, another one for the titles, the sources, the hierarchical structure, and all the natural language labels &mdash; the *meta information*.

Because the information is stored in text files only, no special infrastructure is needed to disseminate the data: No database, no API Server &mdash; a static URL is sufficient to allow anyone to process your data automatically.

There are two common alternatives to our approach: The first alternative is a single spreadsheet, stored as `.csv` or `.xlsx`. Such a two-dimensional design is badly suited to hold comprehensive, nested hierarchical information, let alone multi-lingual labels. Multi line headers can be used to solve some of these problems, but they are a nightmare for automated processing.

The second alternative is a single file in a format that allows hierarchical data such as `.json` or `.xml`.
Such files can be processed automatically, but are hard to read and understand for humans, and are hard to manipulate in standard software such as Excel.

## CSV + JSON = swissdata

We address these drawbacks by keeping the information in two files:

- We keep the **data** in their most simple, most intuitive format, most accessible, non-proprietary format &mdash; a simple CSV file.

- The **meta information** (data description) gets the most flexible, most cosmopolitan, most accessible, non-proprietary format &mdash; a JSON file.

Variables inside these files are linked together through their identifiers.
The following paragraphs take a closer look at these files.


### Data: CSV

Consider the following example of quarterly Swiss GDP, published by the State Secretariat of Economic Affairs (SECO).
The official data are available as a collection of Excel files for now, but the SECO started an additional [test release](https://www.seco.admin.ch/seco/en/home/wirtschaftslage---wirtschaftspolitik/Wirtschaftslage/bip-quartalsschaetzungen-/daten.html) in a format that is easy to read for machines. The [CSV](https://www.seco.admin.ch/dam/seco/de/dokumente/Wirtschaft/Wirtschaftslage/BIP_Daten/ch_seco_gdp_csv.csv.download.csv/ch_seco_gdp.csv) looks like this:

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

Each combination of key columns uniquely identifies a time series within the `.csv` file. The combination of all key columns and the date results in a **composite primary key** that identifies an observation.
All headers and key parts must be lowercase, ASCII only and may not contain spaces.

A long format offers the following advantages over a wider structure, particularly for use with time series data:

1. Series can be of different length, without the need for missing values.

2. Series can be of different frequencies, e.g., quarterly and monthly, in the same file.

Another example for a data file can be found in [`data/ch_adecco_sjmi.csv`](https://github.com/swissdata/demo/blob/master/data/ch_adecco_sjmi.csv).

### Meta Information: JSON

The meta information (data description) is stored in a hierarchical [JSON](https://www.json.org/json-en.html) structure. It contains:

- general information on the data set, such as title, source and details.

- information on hierarchical structure (e.g., private consumption is part of GDP)

- all labels in arbitrary languages

- a time stamp of the last update. To check if new data are available, it is sufficient to download and inspect the JSON file.

Most modern web browsers provide a user friendly visualization of the JSON structure.

Note also, that mapping modular parts of the meta information (dimensions) to their labels has two major advantages over 2-dimensional data formats:

1. No repetitive missing values needed, when information is missing, e.g., some description is not fully translated to every language.

2. Meta information is not stored redundantly alongside every data record.

The GDP meta information can be downloaded from [here](https://www.seco.admin.ch/dam/seco/en/dokumente/Wirtschaft/Wirtschaftslage/BIP_Daten/ch_seco_gdp_json.txt.download.txt/ch_seco_gdp_json.txt).

Another example for a JSON with meta information can be found in [`data/ch_adecco_sjmi.json`](https://github.com/swissdata/demo/blob/master/data/ch_adecco_sjmi.json).

## Code Examples

#### R

A demo script at [`R/script.R`](https://github.com/swissdata/demo/blob/master/R/script.md).

There is also a [demo script](http://www.christophsax.com/stuff/script.R) that showcases the use of the SECO data.

<!-- #### Python -->


## Live Examples

The following projects use a similar framework to source their data or to make them available to the public.

- [dataseries.org: Switzerland's data series in one place](http://www.dataseries.org/).
Uses data stored in swissdata format and visualizes it on a Website.

- [SECO Quarterly GDP](https://www.seco.admin.ch/seco/en/home/wirtschaftslage---wirtschaftspolitik/Wirtschaftslage/bip-quartalsschaetzungen-/daten.html). Currently a test release, but a [demo script](http://www.christophsax.com/stuff/script.R) for how to work with swissdata data in R can be found here.

- [KOF High Frequency Economic Monitoring](https://kofdata.netlify.com/) A recent project of the KOF Swiss Economic Institute (KOF ETHZ) collects high frequency datasets to monitor the Swiss economy. Datasets are exchanged in close collobaration with open data pioneers from the cantonal statistical office of Zurich. The project disseminates data in the swissdata format.

## Your Data Machine Readable


Do you consider publishing your data in a similar fashion? We are interested in sharing our experience and work together towards a more structured format for machine readable data.

Do you have feedback or suggestions on how to improve *swissdata*?
[**contact us!**](mailto:bannert@kof.ethz.ch)


## About

Swissdata is an independent project by [@christophsax](https://github.com/christophsax/) and [@mbannert](https://github.com/mbannert/).


