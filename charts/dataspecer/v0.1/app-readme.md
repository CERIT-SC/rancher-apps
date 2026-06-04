# Dataspecer

[Dataspecer](https://dataspecer.com) is a set of tools for effortless management and creation of data specifications.

This application deploys the Dataspecer workspace, which includes:

- **Conceptual Model Editor** — design and edit conceptual data models.
- **Data Specification Editor** — create and manage data specifications.
- **Manager** — browse and organize your specifications.

The application is served by a single backend and is protected by basic authentication.

## Access

After deployment, open your browser at the URL shown in the deployment notes (e.g. `https://dataspecer-<namespace>.dyn.cloud.e-infra.cz`).

Log in with the username and password you provided in the form.

## Data Persistence

By default, a persistent volume is created for the SQLite database. Your specifications will survive pod restarts.

## Resources

Default resource limits are 1 CPU and 512 MiB memory. You can adjust these in the form below.
