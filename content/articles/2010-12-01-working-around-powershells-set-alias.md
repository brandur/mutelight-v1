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
set-alias vehicles vehiclesfunc
function vehiclesfunc { invoke-sqlcmd "select * from agencyvehicle" }
</code>

It works by creating a function target containing our desired command and aliasing to that function instead of the command directly. It's easy to remember and doesn't come with any harmful side effects.
