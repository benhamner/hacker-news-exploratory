RAW_DIR     = Raw

regenerate:

Raw/.sentinel:
	mkdir Raw
	touch Raw/.sentinel

raw: Raw/.sentinel regenerate
	psql -U postgres -d hackernews -c "COPY (SELECT id,score,by,title FROM items WHERE type='story' ORDER BY id ASC LIMIT 100000) TO STDOUT WITH CSV HEADER;" > $(RAW_DIR)/items.csv 
