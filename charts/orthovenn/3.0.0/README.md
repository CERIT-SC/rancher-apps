# OrthoVenn 3

[OrthoVenn 3](https://orthovenn.bioinfotoolkits.net/) compares the genomes of up
to twelve species. It finds the groups of genes they have in common, draws the
Venn diagram of the overlaps, and tells you which biological functions are
over-represented in whichever part of the diagram you click on.

This is the Rancher version of the app, so installing it is a matter of filling
in a short form.

## Installing it

1. Find **OrthoVenn 3** in the Rancher app catalogue and click Install.
2. Choose the project or namespace it should live in.
3. Give it a name. Keep it short — the name becomes part of the web address.
4. Fill in the form:
   * a **login name and password**, which everyone who uses the app will share;
   * the **data volume size** — how much room you want for genomes and results;
   * how much **CPU and memory** the analyses may use.
5. Click Install and wait. The first start takes a few minutes.

Everything else has a sensible default, so you can leave it alone.

## The web address

You do not have to pick one. The app gets its address from the name you gave it
and the namespace it went into:

```
https://<name>-<namespace>.dyn.cloud.e-infra.cz
```

So an app named `ortho` in a namespace called `mylab` ends up at
`https://ortho-mylab.dyn.cloud.e-infra.cz`. On some clusters the ending is
`dyn.cloud.trusted.e-infra.cz` instead; either way Rancher shows the real
address in the notes after installing. The certificate for it is arranged
automatically, so the address works over HTTPS straight away.

## Signing in

OrthoVenn has no user accounts. Instead, the whole site asks for the login name
and password you entered during install — the browser prompts for them the first
time someone opens the page. Everyone shares that one login, so treat it as a
door key rather than a personal account.

If you forget the password, reinstall or edit the app in Rancher and set a new
one.

## Storage

The app gets two disks: a small one for its database, and a larger one for
uploaded genomes, working files and finished results. The second one is the one
that fills up, and it **cannot be made smaller later** — so if you expect to
work with many large genomes, ask for more room at install time than you think
you need.

Both disks are deliberately **kept when you uninstall the app**, so removing it
by accident does not throw away your data. Reinstalling with the same name and
namespace picks them back up.

## Uninstalling

Uninstalling from Rancher removes the app but leaves the two disks behind. To
free that space as well, go to Rancher's storage section afterwards and delete
the app's two volumes — their names end in `-db` and `-home`. That step is
irreversible.
