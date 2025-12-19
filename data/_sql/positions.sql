CREATE TABLE positions (
    id serial PRIMARY KEY,
    company_id integer,
    title text,
    description text,
    pay_amount numeric (10,2),
    pay_freq pay_freq_enum,
    raw_loc text,
    station_prox station_prox_enum,
    nearest_hub_id integer,
    loc geography(Point, 4326),
    loc_verify boolean default false,
    
    CONSTRAINT fk_company_id
    	FOREIGN KEY (company_id)
    	REFERENCES companies(id)
    	ON DELETE CASCADE,
    	
    CONSTRAINT fk_nearest_hub_id
    	FOREIGN KEY (nearest_hub_id)
    	REFERENCES hubs(id)
    	ON DELETE SET NULL
);