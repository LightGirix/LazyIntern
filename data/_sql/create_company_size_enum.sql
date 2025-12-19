CREATE TYPE  company_size_enum AS ENUM (
    'unspecified',
    'small', --[note: 'Have up to 50 employee(s)']
    'medium', --[note: 'Have 50 up to 200 employee(s)']
    'big' --[note: 'Have more than 200 employee(s)']
)