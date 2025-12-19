CREATE TABLE hubs (
	id SERIAL PRIMARY KEY,
	name_en TEXT,
	name_th TEXT,
	loc GEOGRAPHY(Point, 4326)
)
