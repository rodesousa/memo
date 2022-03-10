# deselected

When i want remove a item into list in liveview

```
def handle_event("deselected-tag", %{"tag" => tag}, socket) do
    {
      :noreply,
      assign(
        socket,
        tags: socket.assigns.tags -- [tag]
      )
    }
  end
```

```
<div class="border rounded-md font-bold text-sm rounded-md py-1 px-4 text-center hover:bg-red-600 hover:text-white" phx-click="deselected-tag" phx-value-tag={tag} phx-target={@myself}>
  <%= tag %>
</div>
```
