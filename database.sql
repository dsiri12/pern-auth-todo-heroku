-- -- $psql -U dba -d postgres

-- CREATE DATABASE auth_todo_database;
-- -- postgres=>\c jwt_database
-- --set extention
-- CREATE TABLE users(
--     user_id uuid PRIMARY KEY DEFAULT
--     uuid_generate_v4(),
--     user_name VARCHAR(255) NOT NULL,
--     user_email VARCHAR(255) NOT NULL,
--     user_password VARCHAR(255) NOT NULL
-- );

-- CREATE TABLE todo(
--     todo_id SERIAL,
--     user_id UUID,
--     description VARCHAR(255),
--     PRIMARY KEY (todo_id),
--     FOREIGN KEY (user_id) REFERENCES users(user_id)
-- );

CREATE DATABASE auth_todo_database;

--users

CREATE TABLE users(
    user_id UUID DEFAULT uuid_generate_v4(),
    user_name VARCHAR(255) NOT NULL,
    user_email VARCHAR(255) NOT NULL UNIQUE,
    user_password VARCHAR(255) NOT NULL,
    PRIMARY KEY (user_id)
);

--todos

CREATE TABLE todos(
    todo_id SERIAL,
    user_id UUID,
    description VARCHAR(255) NOT NULL,
    PRIMARY KEY (todo_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

--fake users data

insert into users (user_name, user_email, user_password) values ('Alexa', 'alexa@gmail.com', 'test123');

--fake todos data

insert into todos (user_id, description) values ('1c61a5fe-0123-43b4-9289-06112c35c0df', 'clean room');