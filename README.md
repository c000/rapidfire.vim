# Rapidfire.vim
Rapid editable EX command launcher.

![rapidfire](https://user-images.githubusercontent.com/888388/83955344-e5a67280-a88c-11ea-8b0b-b62f10f73806.gif)

## Usage

Launch rapidfire by:
```.vim
:Rapidfire CACHESTR
```
Then you can see rapidfire prompt, and you can input and execute ex command same as you type `:`.
For example:
```.vim
Rapidfire[CACHESTR] :make
```
That means same as `:make`.

And launch rapidfire again by the same CACHESTR:
```.vim
:Rapidfire CACHESTR
```
You can see rapidfire promt filled by you last executed.
And you can edit and execute same or modified commands.

### Key mappings

You map the :Rapidfire command for normal mode.
For example, maps `<F1>` key to `Rapidfire` by:
```.vim
nnoremap <F1> :<C-u>Rapidfire CACHESTR<CR>
```

If you want same cache space, you can use same cache strings.
For example: map `<F2>` key to `Rapidfire` and share `<F1>` and `<F2>` rapidfire cache by:
```.vim
nnoremap <F2> :<C-u>Rapidfire CACHESTR<CR>
```

#### Example mappings
Map all function keys to rapidfire:
```.vim
nnoremap <F1> :<C-u>Rapidfire F1<CR>
nnoremap <F2> :<C-u>Rapidfire F2<CR>
nnoremap <F3> :<C-u>Rapidfire F3<CR>
nnoremap <F4> :<C-u>Rapidfire F4<CR>
nnoremap <F5> :<C-u>Rapidfire F5<CR>
nnoremap <F6> :<C-u>Rapidfire F6<CR>
nnoremap <F7> :<C-u>Rapidfire F7<CR>
nnoremap <F8> :<C-u>Rapidfire F8<CR>
nnoremap <F9> :<C-u>Rapidfire F9<CR>
nnoremap <F10> :<C-u>Rapidfire F10<CR>
nnoremap <F11> :<C-u>Rapidfire F11<CR>
nnoremap <F12> :<C-u>Rapidfire F12<CR>
let g:rapidfire#persistent_filename = '~/.cache/rapidfire/commands.json'
```
