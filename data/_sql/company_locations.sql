CREATE TABLE company_locations (
	id serial PRIMARY KEY,
	company_id integer,
	name text,
	is_head_office boolean NOT NULL DEFAULT FALSE,
	raw_loc text,
    loc geography(Point, 4326),
    loc_verify boolean NOT NULL DEFAULT FALSE,
    nearest_hub_id integer,
    nearest_hub_dist NUMERIC(10, 2),
    station_prox station_prox_enum,
    
    CONSTRAINT fk_loc_to_company_id
    	FOREIGN KEY (company_id)
    	REFERENCES companies (id)
    	ON DELETE SET NULL,
    
    CONSTRAINT fk_nearest_hub_id
    	FOREIGN KEY (nearest_hub_id)
    	REFERENCES hubs (id)
    	ON DELETE SET NULL
);