pip install --upgrade twarc 

twarc2 configure 

twarc2 search --start-time 2020-02-01 --end-time 2021-10-30  --archive  "(vax OR vaccine OR vaccinate OR  vaccination OR jab OR pfizer OR astrazeneca) place_country:au" > tweets_raw.json 

twarc2 flatten tweets_raw.json tweets.json 

cat tweets.json |jq 'select(.lang=="en")'| jq -r '[.id, .created_at, .author.name, .author.username, .author.location, .geo.full_name, .author.description,  .text] | @tsv' > tweets.tsv  

wc -l tweets.tsv 
