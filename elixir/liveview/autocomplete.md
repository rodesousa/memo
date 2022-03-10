# autocomplete

## Code

```
  <div>
    <input type="text" list="autocomplete" autocomplete="off"/>
    <datalist id="autocomplete" >
      <%= for autocomplete <- @autocompletes do %>
        <option value={autocomplete} ><%= autocomplete %></option>
      <% end %>
    </datalist>
  </div>
```

## When i want to do more than one value ?

I need to enable the `phx-suggets` but I haven't tried it
