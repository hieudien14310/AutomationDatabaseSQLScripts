CREATE TABLE user_meta_data (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),Add commentMore actions
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
