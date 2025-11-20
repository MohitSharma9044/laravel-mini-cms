
# Mini CMS – Laravel 12 + React 19
A complete Content Management System built as per assignment requirements.  
Includes:

- **Laravel 12 Backend API**
- **React 19 Admin Panel**
- **Blade-based Public Website**


## Project Structure

/backend        Laravel project (API + Public Website)
/admin          React Admin Panel
README.md
.env.backend    Backend environment example
.env.admin      Admin environment example
blogcms.sql     Database dump

## Backend Setup (Laravel 12)

cd backend
composer install
cp .env.example .env
php artisan migrate --seed or php artisan migrate:fresh --seed
php artisan storage:link


## Admin Setup (React 19)

cd admin
npm install
cp .env.example .env
VITE_API_URL=http://localhost:8000/api ---> update url
npm run dev


#  API Endpoints

1.
| Method | Endpoint    | Description            |
| ------ | ----------- | ---------------------- |
| POST   | /api/login  | Login                  |
| POST   | /api/logout | Logout (auth required) |
| GET    | /api/me     | Get authenticated user |

| Method | Endpoint          | Description      |
| ------ | ----------------- | ---------------- |
| GET    | /api/posts        | List all posts   |
| GET    | /api/posts/{post} | View single post |


| Method | Endpoint                  | Description          |
| ------ | ------------------------- | -------------------- |
| POST   | /api/posts                | Create post          |
| PUT    | /api/posts/{post}         | Update post          |
| DELETE | /api/posts/{post}         | Delete post          |
| PATCH  | /api/posts/{post}/publish | Toggle publish state |


| Method | Endpoint           | Description         |
| ------ | ------------------ | ------------------- |
| GET    | /api/media         | List uploaded media |
| POST   | /api/media         | Upload new media    |
| DELETE | /api/media/{media} | Delete media        |


| Method | Endpoint          | Description    |
| ------ | ----------------- | -------------- |
| GET    | /api/pages        | List all pages |
| POST   | /api/pages        | Create page    |
| POST   | /api/pages/{page} | Update page    |
| DELETE | /api/pages/{page} | Delete page    |


| Method | Endpoint             | Description         |
| ------ | -------------------- | ------------------- |
| GET    | /api/dashboard-stats | Dashboard analytics |


# Deliverables Included

`/backend` Laravel project  
`/admin` React project  
README.md  
`.env.backend` for backend  
`.env.admin` for admin  
blogcms.sql   
