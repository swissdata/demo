# swissdata - Machine Readable Public Data

*swissdata* is an independent effort to improve machine readibility of publicly available data. The project was born based on our need to make macroeconomic data more accesible, but the format is well suited for other datasets and their meta information, too. 

## The swissdata Format Explained: long format csv + json = swissdata

The **basic idea** behind the data format suggested by the *swissdata* initiative is to **separate data**
from its **description**. This seperation makes sense for two reasons: First, typical **2-dimensional spreadsheet** formats like .csv or .xlsx are **not well suited** to hold comprehensive, **nested**, let alone multi-lingual **meta information**. **Second**, only compact but unique, **single line column headers** are well suited for **automated processing**.  

- So why not give data their most simple, most intuitive format, most accesible, non-propietary format? (.csv)
- So why not give meta data their most flexible, most cosmopolitan, most accesible, non-propietary format? (.json)

and link information by a unique variable identifier? This is exactly what swissdata is. 

### Data Format in detail: Long Format CSV

Consider the following example of Estimates of the Swiss GDP, originally published by the State Secretariat of Economic Affairs (SECO), ch_seco_gdp.csv:

```
structure,type,seas_adj,date,value
gdp,nom,csa,1980-01-01,48861.3058246375
gdp,nom,csa,1980-04-01,49415.3500513887
gdp,nom,csa,1980-07-01,50142.2214011581
...
gdp,nom,nsa,1980-01-01,TODO
gdp,nom,nsa,1980-04-01,TODO
gdp,nom,nsa,1980-07-01,TODO

```

The .csv file contains the following column as indicated by its first line (header):

1. **key** columns: structure, type, seas_adj.
2. **date** column: YYYY-mm-dd formated date.
3. **value** column.

The combination of **all** key columns results in a so-called composite primary key which uniquely 
identifies each variable / timeseries within a dataset (.csv file). All headers and key parts must be lowercase, ASCII only and may not contain spaces. 

### Metadata Format in Detail: JSON, Dimension labels and Dimensions


## Code Example: Processing Data with R

## Code Example: Processing Data with Python




## Live Examples

The following projects use the swissdata framework and format to source data.

- [dataseries.org - Switzerland's data series in one place](http://www.dataseries.org/)
- [SECO's GDP Estimates - published as swissdata format]()

## Publish Your Datasets in the Swiss Data Format

Are you data provider and consider publishing your data in machine readable fashion? 
Our framework can help to turn your existing data into swissdata. And remember, swissdata happily 
lives along other publication formats that might be more suitable for humans to read.
You can very well publish swissdata compliant data alongside existing publications. 

## Feedback 
Do you have feedback or suggestions on how to improve *swissdata* ? 



## About 

Swissdata is an independent project by @christophsax and @mbannert. 
