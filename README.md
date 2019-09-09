## Project start instructions

### Using Nix or NixOS

0. Install Nix if not on NixOs:  
   `curl https://nixos.org/nix/install | sh`

1. Clone project and `cd` into it

2. `git clone https://github.com/NixOS/nixpkgs.git ~/clones/nixpkgs`

3. Issue `nix-shell` 

   > Read [`shell.nix`](./shell.nix) and/or the [`shell.nixes` README](https://github.com/toraritte/shell.nixes/tree/master/elixir-phoenix-postgres) to see what [`nix-shell`](https://nixos.org/nix/manual/#sec-nix-shell) will do.

4. Start  Phoenix endpoint with `mix  phx.server` or
   `iex -S mix phx.server`

### Otherwise

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Notes and TODOs

### TODO 2019_09_08-2216 Make persistence immutable

For  example,  if  a  user is  deleted,  there  will
be  many  dangling  pointers;   one  example  is  an
`Assessment` where `AssessmentEvent`  holds logs on
who created  it, how user assigments  changed and so
on. Assessments  mustn't be  deleted when a  user is
gone (e.g., `:on_delete`).

Couple possibilities:

 + [make table immutable](https://stackoverflow.com/questions/35919167/postgresql-create-insert-only-table)

 + make  it  impossible   to  update/delete  data  from
   API  and  front-ends  (should  probably  use  it  in
   conjunction with the previous option)

 + use Event Sourcing (with CQRS probably?)
