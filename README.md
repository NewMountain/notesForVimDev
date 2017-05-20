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
  - [x] The basics to make it usable
  


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


### .vimrc

You may or may not have a .vimrc. Open a terminal and type: ```$ vim ~/.vimrc``` This will create an empty file in your root. Any time you want to make changes to how vim works, this is the place to start. 

Let's get the plug system working first. We are not going to do anything, we are just going to get it set up and then focus on a few basic things. 

Type in:

```
call plug#begin()
call plug#end()
```

Those commands invoke the plug system on the boot of vim. If you want to install any plug, you just type:
```
Plug '<githubHandleHere>/<repoNameHere>'
```
between the plug#begin() and plug#end(). Once you enter that in, save ```:w``` and then type ```:PlugInstall```. You should see a new area pop up to your left and update you on the download status of anything new, in this case there is nothing new. As with everything in vim ```:q``` will quit out of the area you are currently in. Remember, vim is militant about the no mouse thing, you can only affect change via keyboard strokes.

With that out of the way, let's set a few sane defaults in our .vimrc, below the plug system.

### Sane Defaults

These are my idiosyncracies. They are important to me, but I totally empathize if your programming patterns differ form my own.

So let's get them up and then talk through them:
```vim
" Sane defaults for me
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
```

So, first, in vim, a comment is a double quote. 

Tabstop is how many spaces a tab should be. I like whitespace and all, but as most languages default to using semi-colons, two spaces is fine as a default (I don't like a lot of indentation in code). For languages where whitespace is syntax (Python Elm and Haskell) we will override with language specific defaults anyway.

shiftwidth is how many spaces an indent should be. I can't see a reason why it would be a different value than tabstop

softtabstop will make the editor insert spaces to simulate a tabstop if the tab key is hit in insert mode. 

expandtab inserts the correct number of actual spaces instead of a tab. While I love tabs as a shorthand for multiple spaces, I think we can all agree actually using tabs in code can be an exercise in making your fellow coders hate you. Let's avoid that.

smarttab allows you to tab into the same tab of the previous line. I most do this as the internet said so.

With that out of the way, we should now add a few plug ins to make things nicer.
