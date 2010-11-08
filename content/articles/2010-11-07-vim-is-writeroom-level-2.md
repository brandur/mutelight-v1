---
title: Vim is WriteRoom Level 2
kind: article
tags: [ 'vim' ]
permalink: /articles/vim-is-writeroom-level-2.html
tiny: /a/30
location: Calgary
---

I'm participating in [NaNoWriMo](http://www.nanowrimo.org/) this month and the absolutely critical tool for someone with Internet-fueled ADD like myself is a suite for distraction free writing that will isolate a writer from the various distractions that their computer system offers.

The traditional choice for this kind of software on Mac OSX has been WriteRoom, an application that will take the user into a very minimalist fullscreen writing mode. Perfect for the aspiring author.

Unfortunately, to a Vim user, WriteRoom s nice but isn't really a tolerable solution. Luckily, using [MacVim](http://code.google.com/p/macvim/) combined with a small startup script, we can replicate the WriteRoom interface and get the best of both worlds.

<code lang="vim">
set lines=50
set columns=80
colorscheme koehler

set guifont=Monaco:h10
set guioptions-=r
set fuoptions=background:#00000000
set fu

" green normal text
hi Normal guifg=#B3EA46
" hide ~'s
hi NonText guifg=bg

" wrap words
set formatoptions=1
set lbr

" make k and j navigate display lines
map k gk
map j gj
</code>

Save this as a @*.vim@ script and source it in using the @mvim@ script that comes with MacVim: @mvim -S <script> <file to edit>@. I personally use set an alias for it as well: @alias vif='mvim -S ~/focus.vim'@.

As you can see, we get an interface nearly indistinguishable from the one offered by WriteRoom, and with the full power of Vim. Outstanding!

<div class="figure">
    <a href="/assets/images/articles/2011-11-07-vim-is-writeroom-level-2/vim-masquerading-as-writeroom.png" title="Link to full-size image"><img src="/assets/images/articles/2010-11-07-vim-is-writeroom-level-2/vim-masquerading-as-writeroom-small.png" alt="Vim masquerading as WriteRoom" /></a>
    <p><strong>Fig. 1:</strong> <em>Vim masquerading as WriteRoom</em></p>
</div>

