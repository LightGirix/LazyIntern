CREATE TABLE company_contacts (
	id serial PRIMARY KEY,
	company_id integer,
	platform VARCHAR(10),
	value text,
	
	CONSTRAINT fk_contact_company_id
		FOREIGN KEY (company_id)
		REFERENCES companies(id)
);