# Bulma-Admin-Rails

Very basic Rails5 app to showcase [font-awesome](https://fontawesome.io), [bulma 0.7.2](https://bulma.io), the bulma-admin template and some other goodies.

It uses the standard stack, besides application.scss no Rails fiddling, which also means turbolinks etc.

Most parts of the layout are taken from the [bulma-admin template](https://github.com/mazipan/bulma-admin-dashboard-template) of Irfan Maulana.

JavaScript usage has been avoided, but is needed for the burger menu and the charts.

I tried to keep the commits relatively clean so you can rebuild this projects skeleton following along.

## Assets

* [font-awesome](https://fontawesome.io) via https://github.com/bokmann/font-awesome-rails
* [bulma](https://bulma.io) via https://rails-assets.org/#/components/bulma
* [bulma-admin template](https://github.com/mazipan/bulma-admin-dashboard-template), obviously modified
* [Chart.js](http://chartjs.org), used for the charts
* [bulma login template](https://github.com/dansup/bulma-templates) from Daniel Supernault

## Kick-Ass-libraries used (besides what comes with rails and ruby)

* haml
* haml-rails
* redcarpet
* emd
* kaminari


## Use it yourself

To demo or play around, clone this repository

  git clone https://github.com/econya/bulma-admin-rails

get dependencies and stuff

  bundle

and start the rails server

  rails s

Now open your browser and with it `http://localhost:3000`.

## TLT - The Little tricks

### Kaminari pagination

pagination views with bulma styles added like this.

### Correct highlighting for 'Active' Navbar element ('current') and submenus

Via NavHelper in `app/helpers/nav_helper` entries in the `app/views/_sidebar` partial can be highlighted or hidden.

Use `NavHelper.nav_is_in?('controller', 'controller2#action')` to query if you currently serve a page from `Controller` or are in `Controller2::action`.  This follows the naming convention in the `routes.rb` file.  An arbitrary long list of arguments is accepted.

This mechanism is used to highlight the current position in the menu (with some assumptions).  As highlighting boils down to css class definition, the `NavHelber.nav_class_if_active('controller2', 'controller1#action)` will exactly do that -> return the correct css class if active.

Again, see this in action in `app/views/_sidebar.html.haml`.

### Rendering markdown via redcarpet and emd

You can include and render markdown files (like this Readme that you are currently reading).

I like to use this e.g. for Changelog files that are distributed with the git repository.

Git does not natively support symlinks, but symlinks on disk will work as expected.

To make markdown files render nicely, some (s)css styles needed to be defined in `app/stylesheets/md.scss` (to use bulma classes).

### Symlinked readme and changelog

See above.  The symlinks where created as:

  # (example for a partial)
  # cd app/views/pages
  ln -s ../../../README.md _readme.md
  # git add _readme.md
  # git commit -m "symlink and add _readme.md"

  # example for the CHANGELOG
  # cd app/views/pages
  ln -s ../../../CHANGELOG.md changelog.md
  # git add changelog.md
  # git commit -m "symlink and add changelog.md"

### Bulma Form Helper

In `app/helpers/bulma_form_builder` a FormBuilder is implemented to create somewhat okayish looking fomrs.
(also config/environment.rb changes)


## How assets are organised (autload in stylesheets/scss)

Used rails-asset.org to pull in bulma and so on.

## License

See individual licenses above, all other (Rails-related) code is released under the GPLv3+ and Copyright 2018 Felix Wolfsteller.
