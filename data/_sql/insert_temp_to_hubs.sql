INSERT INTO hubs (id, name_en, name_th, loc)
SELECT 
	th.id, 
	th.name_en,
	th.name_th,
	ST_SetSRID(ST_MakePoint(th.longitude, th.latitude), 4326)::GEOGRAPHY
FROM
	temp_hubs th