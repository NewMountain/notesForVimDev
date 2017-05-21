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

### Basic plug ins

So we are going to add five plug ins which are super great. Once we get those out of the way, we will begin to explore further tweaks in Python. Python is quite opinionated as to what good python should look like so it is easy to test whether you plugs are working and, if so, how well.

Let's get to it!


Let's add vim-sensible by Mr. Pope who is basically the lord of vim. I trust his choices.

So, we want NERDTree. It's a file tree and it is amazing. 

We will use airline (some people use powerline, which is cool, I'm not really sure of the difference but some people in elm land seem more jazzed up about airline, so i'll let them make the decusuion for me. It provides you a nice context-aware coloring for what is going on in the screen above it.

We will add another classic from Mr. Pope, vim-fugitive, for a super-slick integration with Git.

Finally, we will add syntastic. As far as I can tell, it is the default all-singing all-dancing syntax highlighter in vim land. Sounds like a good choice to get started.

Our .vimrc should now look like this:
```vim
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
call plug#end()
```

Remember, ```:wq``` then ```$ vim ~/.vimrc``` then ```:PlugInstall``` and voila! You're in the business.

Let's git clone this repo to test out vim-fugitive.
```bash
$ git clone https://github.com/NewMountain/notesForVimDev
``` 
Now that we have that, we can see we have git integration upon opening the file. Let's do a few basic git commands.

This is a test of git add.

Nice. This is a little off at first, but I could see myself qucikly getting used to this.

### Make a python file then walk through the configuration

So let's use NERDTree to create a new python directory and then file. Write a python so bad that the editor can't help but yell at us, then fix it.

That all went well. This seems to be working well now. Python lints and I made another commit. Life is looking good. Let's check what the .vimrc looks like at this point.


```vim
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
call plug#end()
 
" Sane defaults for me
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set number
 
" Syntastic config for python
let g:syntastic_python_checkers=['pep8', 'pyflakes', 'pylint', 'pydocstyle']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
```
