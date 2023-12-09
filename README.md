# Backup 02 - Pets

This project provides a RESTful API for managing pet records in a MySQL database named `petsdb`. This API allows you to perform CRUD (Create, Read, Update, Delete) operations on the pet records stored in the `pets` table.

**Made by:** José Alejandro Castrillón Ortega.

## Table of contents

1. [Features](#features)
2. [Tecnologies used](#technologies-used)
3. [Requirements](#requirements)
4. [Getting Started](#getting-started)
5. [Usage](#usage)

## Features

- **Create:** Add new pet records to the database with pet data.
- **Read:** Retrieve information about existing pets from the database.
- **Update:** Modify the details of a pet in the database.
- **Delete:** Remove a pet record from the database.

## Technologies Used

- **Express.js:** A fast, unopinionated, minimalist web framework for Node.js, used for building the API endpoints and handling HTTP requests.
- **Sequelize:** A promise-based Node.js ORM for MySQL, used for managing the database, defining models, and executing queries.
- **dotenv:** A zero-dependency module for loading environment variables from a .env file, helping to keep sensitive information secure.
- **nodemon:** Monitors for changes in files and automatically restarts the server during development.

### Requirements

- NodeJS & npm.
- MySQL.
- A shell terminal to run shell scripts (bash).

### Getting Started

a. Clone the repository:
```bash
git clone https://github.com/alejo-c/backend-02.git
```

b. Install dependences:
```bash
npm install
```

c. Create enviroment variables file:
```bash
# .env
DB_HOST=localhost
DB_USER=<your_username>
DB_PASSWD=<your_password>
DB_NAME=petsdb
```

d. Import the database backup:
```bash
# Log in as a MySQL root user
mysql -u root -p

# Create the database
CREATE DATABASE petsdb;

# Create a new user
CREATE USER '<your_username>'@'localhost' IDENTIFIED BY '<your_password>';

# Grant privileges to the user for the 'petsdb' database
GRANT ALL PRIVILEGES ON petsdb.* TO '<your_username>'@'localhost';

# Flush privileges to apply the changes
FLUSH PRIVILEGES;

# Restore data into the database
source petsdb.bk.sql
```

### Usage

a. Start the application
- Normally:
    ```bash
    npm run start
    ```
- Development mode:
    ```bash
    npm run dev
    ```
    
b. Create new pet data:
```bash
# curl -d '{"name":"<name>", "age":"<age>"}' -H "Content-Type: application/json" -X POST http://localhost:8000/pets/create
npm run create <name> <age>
npm run create <name>       # The age is optional
```

b. Read pets data:
```bash
# curl -s "http://localhost:8000/pets/"
npm run read        # All pets data

# curl -s "http://localhost:8000/pets/<id>"
npm run read <id>   # A single one by id
```

c. Update data by pet id:
```bash
# curl -d '{"name": <name>, "age": <age>}' -H "Content-Type: application/json" -X PUT "http://localhost:8000/pets/update/<id>"
npm run update <id> name <name> age <age>
npm run update <id> name <name>
npm run update <id> age <age>
```

d. Delete data by pet id:
```bash
# curl -s -X DELETE "http://localhost:8000/pets/delete/<id>"
npm run delete <id>
```