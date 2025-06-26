This repository is used to manage **PostgreSQL** SQL statements in order and automatically execute them whenever they are merged into the **deploy-sql** branch.

> When you want to add a new SQL file, please checkout from the main branch, then create a PR to main. After merging into main, create another PR from main to the deploy-sql branch to run the new SQL statements.

**Only one connection is supported per repository. If you want to use a different connection, you should fork the repository and change the SECRET DATABASE_URL.**

## Important Notes

Currently, there is no support for reverting after SQL statements have been executed. You must create a new SQL file and deploy again to fix any issues.

If you update an incorrect SQL statement, simply create a new SQL file to correct the mistake.

## Syntax to connect to your PostgreSQL server

```
psql -h <host_name> -p <PORT> -U <user_name>
```

Example, if the user is postgres and the database is mydb:

```
psql -h localhost -p 5432 -U postgres -d mydb
```

## Value for Secret DATABASE_URL

Go to your repository >> settings >> Secrets and variables >> Create a key named **DATABASE_URL**

Note: DATABASE_URL should not contain the database name at the end, just end with a `/`.

```
postgresql://postgres:123456789!@#ZXC@postgres.abcxyz.click:5432/
```

## Directory Structure

```
| scripts - Folder to store SQL files for each DB
|-database name 1 - Folder name should match your database name
|--001-filename.sql - It is recommended to prefix the SQL file name with an index and purpose
|--002-filename.sql
|--003-filename.sql
|-database name 2
|--...
|-database name 3
|--...
```

## Setup Instructions

- You must create the database first, then create a folder with the same name (inside the scripts directory)
- Fork this repository, then delete all existing folders in `scripts`. Then create new folders as needed
- Create a branch named deploy-sql. You can change the name in deploy-sql.yml if needed
- Remember to update the value in SECRETS.DATABASE_URL

## Rules when merging into the main branch

There are a set of rules to check when you merge a PR into the main branch. You can view them in the `.github/workflows/` directory.

```
- sql_linter.yml: Used to check PostgreSQL syntax. The configuration for checking is in the .sqlfluff file, which can be customized as needed
- no_update_old_file_sql.yml: Used to check if any old SQL files have been modified
- no_delete_old_file_sql.yml: Used to check if any old SQL files have been deleted
```
