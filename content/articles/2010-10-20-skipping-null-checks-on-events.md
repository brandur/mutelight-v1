---
title: "Skipping Null Checks on Events"
kind: article
tags: [ 'csharp', 'development', 'dotnet' ]
permalink: "/articles/skipping-null-checks-on-events.html"
tiny: /a/29
location: Calgary
created_at: 2010-10-20
---

Yesterday I learned a neat C# trick that can be used to skip the traditional null check associated with defining, then firing events:

<code lang="csharp">public class MyClassWithAnEvent
{
    public event EventHandler MyEvent;

    protected void FireMyEvent()
    {
        if (MyEvent != null)
            MyEvent(this, EventArgs.Empty);
    }
}</code>

By immediately assigning the event with an empty event handler, we can guarantee that the event is never null, thereby saving us a line of code whenever we call it:

<code lang="csharp">public class MyClassWithAnEvent
{
    public event EventHandler MyEvent = (o, e) => {};

    protected void FireMyEvent()
    {
        MyEvent(this, EventArgs.Empty);
    }
}</code>
