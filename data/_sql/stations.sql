CREATE TABLE stations (
	id serial PRIMARY KEY,
	station_code VARCHAR(10),
	line_code line_code_enum,
	hub_id INTEGER,
	active BOOLEAN NOT NULL DEFAULT FALSE,
	
	CONSTRAINT fk_hubs_id
		FOREIGN KEY (hub_id)
		REFERENCES hubs(id)
		ON DELETE SET NULL
);			