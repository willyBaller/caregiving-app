
# Caregiving App

This repository contains a minimal starter for a caregiving application built with **Next.js** and **Supabase**. It includes a basic project structure, a simple UI, and SQL scripts to set up your Postgres database with the required tables and row‑level security policies.

## Getting started

1. **Create a Supabase project.** Use the [Supabase dashboard](https://app.supabase.com/) to create a new project in your preferred region. Once created, copy the `API URL` and `anon key` from the project settings.

2. **Run the database scripts.** In the Supabase dashboard, open the SQL editor and run the scripts in `supabase/schema.sql`, `supabase/rls.sql`, and `supabase/seed.sql` (in that order). This will set up your tables, enable row level security, apply default policies, and seed a sample client named Jan with a library routine.

3. **Configure your environment.** Rename `.env.example` to `.env.local` and set the values for `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY` using the information from your Supabase project.

4. **Install dependencies and run locally.** In a local terminal run:

   ```bash
   npm install
   npm run dev
   ```

   This will install the dependencies (Next.js, React, Supabase, Tailwind CSS) and start the development server at `http://localhost:3000`.

5. **Deploy to Vercel.** Push this repository to GitHub (or your preferred Git provider) and import it into [Vercel](https://vercel.com/). Set the same environment variables in the Vercel dashboard under *Environment Variables* and deploy. Vercel will build and host your application automatically.

## Directory structure

```
.
├── package.json          # Project dependencies and scripts
├── tsconfig.json         # TypeScript configuration
├── next.config.js        # Next.js configuration
├── postcss.config.js     # PostCSS configuration for Tailwind CSS
├── tailwind.config.js    # Tailwind CSS configuration
├── src/
│   ├── app/
│   │   ├── globals.css   # Global styles with Tailwind CSS imports
│   │   ├── layout.tsx    # Root layout component
│   │   └── page.tsx      # Home page component
│   └── lib/
│       └── supabaseClient.ts # Supabase client factory
├── supabase/
│   ├── schema.sql        # Database schema definitions
│   ├── rls.sql           # Row‑level security policies
│   ├── seed.sql          # Seed data for development/testing
│   └── api.openapi.yaml  # Minimal OpenAPI specification
└── .env.example          # Template for environment variables
```

## Notes

* The row‑level security policies in `supabase/rls.sql` currently allow any authenticated user to read and write all tables. You should refine these policies to suit your application’s role requirements.
* For demonstration purposes the seed data includes a single client (`Jan`) with a weekly library visit routine. Feel free to adjust or remove this data as needed.

Enjoy building your caregiving application!
