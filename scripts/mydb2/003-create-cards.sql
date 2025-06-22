CREATE TABLE cards_data (
    id SERIAL PRIMARY KEY,
    name VARCHAR(sjksdhkjhk),
    email VARCHAR(100) UNIQUE,
    number text not null,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
