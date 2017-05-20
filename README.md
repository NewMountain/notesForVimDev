# notesForVimDev


## My vim setup for all of my development

I am creating this file as, for various reasons, it looks like I will need to fall back from VSCode to Vim. I have
casually used Vim in the past, but my sense is this will be a more long term use and needs to be properly setup to meet
my day-to-day needs.

### Goals:
  - [ ] To highlight in all of the languages (I'm sorry, I always cringe when Html and CSS are included in languages as well) I use and need
    - [ ] Haskell
    - [ ] Elm
    - [ ] Javascript
    - [ ] Python
    - [ ] Elixir
    - [ ] HTML
    - [ ] CSS
  - [ ] To lint in all the languages required
  - [ ] File tree
  - [ ] Auto-formatting where a language supports it
  - [ ] The basics to make it usable
  


### The basics

So the first thing we need is Vim and a plug manager

Getting vim on a linux system is easy enough:

```bash
$ sudo apt-get install vim
```

Cool. Now we need a plugin manager. In a past life, I used Vundle, but it seems these days all the cool kids are using Plug.
This is fine with me as plug appears to be dead-simple to use (which is nice).

```bash
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

At this point, if vim is new and crazy to you, or seems like a cruel joke from the past, I suggest you type: vimtutor and spend the 45 minutes you need to get a nicer intro to vim.


Cool. Now let's make a .vimrc and get started.
