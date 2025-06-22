CREATE TABLE information (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),Add commentMore actions
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) not null,
);
