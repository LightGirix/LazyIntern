CREATE Table companies (
    id serial PRIMARY KEY,
    name text not NULL,
    size company_size_enum,
    description text,
    img_url text
)