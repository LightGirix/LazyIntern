CREATE TYPE pay_freq_enum AS ENUM (
    'daily',
    'weekly',
    'biweekly',
    'monthly',
    'lump_sum' --[note: 'One-time payment given at the end of a single work']
)