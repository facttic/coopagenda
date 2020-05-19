# Coopagenda

**[Dev in progress]** Web app to organize International Cooperatives Show & Tell meetings. It allows the creation of agenda slots and proposals for specific dates.

## Development

Built using the Elixir's [Phoenix Framework](https://phoenixframework.org/). To run this app you will need:

- Erlang OTP >= 18
- Elixir >= 1.5
- NodeJS >= 5.0
- PostgreSQL >= 11.5

### Start your Phoenix Server

- Install dependencies with `mix deps.get`
- Create and export env variables for your dev PostgreSQL and GitHub auth info configuration. E.g.: `.env.example`
- in /apps/coopagenda: Create and migrate your database with `mix ecto.setup`
- in /apps/coopagenda-web Install Node.js dependencies with `cd assets && npm install`
- in root: Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.  :sparkles:

## License

[![License](https://img.shields.io/github/license/nayracoop/coopagenda)](LICENSE.md)
