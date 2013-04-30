MTAT.03.240 Seminar on Enterprise Software
==========================================

#11 Processing and linking address data
---------------------------------------

### Task description

The aim of this task is to build an address matching engine, which will take an address in a propriatory database in textual form such as "Papiniidu tn 13, Pärnu" and match it with structured records in the official ADS dataset (http://ads.maaamet.ee/). Validate the results with respect to the normalization results given by http://xgis.maaamet.ee/adsavalik/ads (pick Aadressiteksti normaliseerimine from the top menu) .

### Data

[data_sources.yml](data_sources.yml) describes where to find the source data.

### Structure of the data
```
Kehtivad ja ootel olekus aadresiobjektid ning nendega seotud aadressid. Kui objektil on enam kui 1 aadress, siis esineb ta väljavõttes enam kui 1 kord. Samuti esinevad aadressid väljavõttes mitu korda, kui nad on seotud mitme objektiga.
- adob_id (integer) - objekti versioonitunnus
- ads_oid (string)
- adob_liik (string)
- orig_tunnus (string) – objekti tunnus originaalregistris
- etak_id (integer) - objekti identifikaator ETAK süsteemis
- ads_kehtiv (date) – kuupäev, millest alates selle versiooni andmed ADS-s kehtivad
- olek (string) – O–ootel; K-kehtiv
- adr_id (integer)
- koodaadress (string)
- taisaadress (string)
- lahiaadress (string)
- aadr_olek (string)
- viitepunkt_x (decimal) – (6- kohaline matemaatiline X-koordinaat, vastab geograafilisele Y koordinaadile)
- viitepunkt_y (decimal) – (7- kohaline matemaatiline Y-koordinaat, vastab geograafilisele X koordinaadile)
- tase1_kood (string)
- tase1_nimetus (string)
- tase1_nimetus_liigiga (string)
- tase2_kood (string)
- tase2_nimetus (string)
- tase2_nimetus_liigiga (string)
- tase3_kood (string)
- tase3_nimetus (string)
- tase3_nimetus_liigiga (string)
- tase4_kood (string)
- tase4_nimetus (string)
- tase4_nimetus_liigiga (string)
- tase5_kood (string)
- tase5_nimetus (string)
- tase5_nimetus_liigiga (string)
- tase6_kood (string)
- tase6_nimetus (string)
- tase6_nimetus_liigiga (string)
- tase7_kood (string)
- tase7_nimetus (string)
- tase7_nimetus_liigiga (string)
- tase8_kood (string)
- tase8_nimetus (string)
- tase8_nimetus_liigiga (string)
```

### Getting started
0. Get dependencies
```bash
# Sphinx with mysql support (required even if using w/ postgres)
brew install sphinx --mysql
```
1. Get ruby & rails (```$ \curl -L https://get.rvm.io | bash -s stable --autolibs=3 --rails```)
2. ```bundle```
3. Import data ```rake adb:import_data[1_1.04.2013_00001_784_1.csv]```
> This is the smaller dataset.
4. Run the server ```rails server```
5. Make some [searches](http://localhost:3000/)

### Using elasticsearch

1. Install [elasticsearch](http://www.elasticsearch.org/). ```brew install elasticsearch```
2. Run it ```elasticsearch -f -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml```
