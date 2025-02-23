CREATE TABLE IF NOT EXISTS roles (
    id SERIAL PRIMARY KEY,
    role VARCHAR(63) NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    login TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    role_id INTEGER NOT NULL REFERENCES roles(id),
    phone VARCHAR(11) UNIQUE,
    mail TEXT UNIQUE
);


CREATE TABLE IF NOT EXISTS payment_method (
    id SERIAL PRIMARY KEY,
    method TEXT NOT NULL
);


CREATE TABLE IF NOT EXISTS cashback (
    id SERIAL PRIMARY KEY,
    name VARCHAR(63) NOT NULL,
    description TEXT,
    is_partner BOOLEAN NOT NULL DEFAULT FALSE,
    season INTEGER NOT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date  TIMESTAMP
);


CREATE TABLE IF NOT EXISTS season_cashback (
    id SERIAL PRIMARY KEY,
    season_name TEXT NOT NULL
);



CREATE TABLE IF NOT EXISTS transaction (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    payment_method INTEGER NOT NULL REFERENCES payment_method(id),
    date TIMESTAMP NOT NULL,
    status INTEGER NOT NULL
);


CREATE TABLE IF NOT EXISTS transaction_cashback (
    id SERIAL PRIMARY KEY,
    transaction_id INTEGER NOT NULL REFERENCES transaction(id),
    cashback_id INTEGER NOT NULL
);


CREATE TABLE IF NOT EXISTS active_cashback (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    cashback_id INTEGER NOT NULL REFERENCES cashback(id)
);

CREATE TABLE IF NOT EXISTS rewards (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    transaction_id INTEGER NOT NULL REFERENCES transaction(id),
    reward_amount DECIMAL(10, 2),
    reward_date TIMESTAMP
);