CREATE Table companies (
    id serial PRIMARY KEY,
    name text not NULL,
    size company_size_enum,
    description text,
    img_url text,
    contacts jsonb,
    raw_loc text,
    loc geography(Point, 4326),
    loc_verify boolean NOT NULL default false
)