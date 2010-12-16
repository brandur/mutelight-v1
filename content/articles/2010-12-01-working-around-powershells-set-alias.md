---
title: "Working Around PowerShell's Set-alias"
kind: article
tags: []
permalink: "/articles/working-around-powershells-set-alias.html"
tiny: /a/34
location: Calgary
created_at: 2010-12-01
---

PowerShell's `set-alias` command is very limited by its apparent inability to easily accept parameters for commands that are being aliased. Those of us who are used to Linux shells where aliases such as `alias ls="ls -lh"` are commonplace have to wrap our heads around the fact that the ideal use case for `set-alias` is a only a simple one to one mapping like `set-alias sql invoke-sqlcmd`.

Fortunately, there's a simple workaround:

<code lang="ruby">
function vehicles { invoke-sqlcmd "select * from agencyvehicle" }
</code>

Use a function instead! The syntax is concise and doesn't come with any harmful side effects.

<span class="addendum">Edit (2010/12/02) &mdash;</span> more logical to use a function rather than an alias to a function (_duh!_).
