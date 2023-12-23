# Pets API Server

This project provides a RESTful API that manages the adoption requests for cats and dogs in a MySQL database named `petsdb`. This API allows you to perform CRUD (Create, Read, Update, Delete) operations on the pet, adopters, and adoptino requests records stored in the `pets`, `adopters` and `adoption_requests` tables, including an extra operations to approve and reject adoption requests.

**Made by:** José Alejandro Castrillón Ortega.

## Table of contents

1. [API Usage](#api-usage)
    1. [Pets CRUD](#pets-crud).
    2. [Adopters CRUD](#adopters-crud).
    3. [Adoption Requests CRUD](#adoption-requests-crud).
2. [For Production](#for-production)
    1. [Requirements](#requirements-for-production)
    2. [Getting Started](#getting-started)
    3. [Usage](#production-usage)

## API Usage

### Pets CRUD

```sh
# Create pet
curl -d '{"type":"<type>", "name":"<name>", "age":"<age>"}' \
    -H "Content-Type: application/json" \
    -X POST https://pets-api-orcin.vercel.app/pets/create
```
```sh
# Show all pets
curl https://pets-api-orcin.vercel.app/pets/
```
```sh
# Show single pet
curl https://pets-api-orcin.vercel.app/pets/<id>
```
```sh
# Update pet
curl -d '{"type":"<type>", "name":"<name>", "age":"<age>"}' \
    -H "Content-Type: application/json" \
    -X PUT https://pets-api-orcin.vercel.app/pets/update/<id>
```
```sh
# Delete pet
curl -X DELETE https://pets-api-orcin.vercel.app/pets/delete/<id>
```

### Adopters CRUD

```sh
# Create adopter
curl -d '{"name":"<name>", "address":"<address>", "contact":"<contact>"}' \
    -H "Content-Type: application/json" \
    -X POST https://pets-api-orcin.vercel.app/adopters/create
```
```sh
# Show all adopters
curl https://pets-api-orcin.vercel.app/adopters/
```
```sh
# Show single adopter
curl https://pets-api-orcin.vercel.app/adopters/<id>
```
```sh
# Update adopter
curl -d '{"name":"<name>", "address":"<address>", "contact":"<contact>"}' \
    -H "Content-Type: application/json" \
    -X PUT https://pets-api-orcin.vercel.app/adopters/update/<id>
```
```sh
# Delete adopter
curl -X DELETE https://pets-api-orcin.vercel.app/adopters/delete/<id>
```

### Adoption Requests CRUD

```sh
# Create adoptionrequest
curl -d '{"pet_id":"<pet_id>", "adopter_id":"<adopter_id>"}' \
    -H "Content-Type: application/json" \
    -X POST https://pets-api-orcin.vercel.app/adoptionrequests/create
```
```sh
# Show all adoption requests
curl https://pets-api-orcin.vercel.app/adoptionrequests/
```
```sh
# Show single adoption request
curl https://pets-api-orcin.vercel.app/adoptionrequests/<id>
```
```sh
# Update adoption request
curl -d '{"pet_id":"<pet_id>", "adopter_id":"<adopter_id>"}' \
    -H "Content-Type: application/json" \
    -X PUT https://pets-api-orcin.vercel.app/adoptionrequests/update/<id>
```
```sh
# Approve adoption request
curl -X PUT https://pets-api-orcin.vercel.app/adoptionrequests/approve/<id>
```
```sh
# Reject adoption request
curl -X PUT https://pets-api-orcin.vercel.app/adoptionrequests/reject/<id>
```
```sh
# Delete adoption request
curl -X DELETE https://pets-api-orcin.vercel.app/adoptionrequests/delete/<id>
```

## For Production

### Requirements for Production

For running the server locally you need the next tecnologies and follow the [next steps](#getting-started).

- Git.
- NodeJS & npm.
- MySQL.

### Getting Started

a. Clone the repository:
```bash
git clone https://github.com/alejo-c/pets-api.git
```

b. Install dependences:
```bash
npm install
```

c. Set up enviroment variables:
```conf
# .env
DB_HOST=localhost
DB_USER=<your_username>
DB_PASSWD=<your_password>
DB_NAME=<your_database>
```
```conf
# .env example
DB_HOST=localhost
DB_USER=root
DB_PASSWD=
DB_NAME=petsdb
```

d. Import the database backup:
```sql
-- Log in as a MySQL root user
mysql -u root -p

-- Use your previous created database
use <database_name>

-- Restore data into the database
source petsdb.bk.sql
```

### Production Usage

Replace the host with `http://localhost:8000` when sending requests.
