CREATE TABLE positions (
    id serial PRIMARY KEY,
    company_id integer,
    work_loc_id integer,
    title text,
    description text,
    pay_amount NUMERIC(10,2),
    pay_freq pay_freq_enum,
    work_model work_model_enum,
    work_duration text,
    accept_coop_ed boolean,
    
    CONSTRAINT fk_position_company_id
    	FOREIGN KEY (company_id)
    	REFERENCES companies(id)
    	ON DELETE CASCADE,
    	
    CONSTRAINT fk_position_work_loc_id
    	FOREIGN KEY (work_loc_id)
    	REFERENCES company_locations(id)
    	ON DELETE SET NULL
);