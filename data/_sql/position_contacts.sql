CREATE TABLE position_contacts (
	id serial PRIMARY KEY,
	position_id INTEGER,
	contact_type VARCHAR(10),
	value TEXT,
	
	CONSTRAINT fk_contact_position_id
		FOREIGN KEY (position_id)
		REFERENCES positions(id)
);