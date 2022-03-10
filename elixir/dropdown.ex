def link(%{navigate: _to} = assigns) do
  assigns = assign_new(assigns, :class, fn -> nil end)

  ~H"""
  <a href={@navigate} data-phx-link="redirect" data-phx-link-state="push" class={@class}>
    <%= render_slot(@inner_block) %>
  </a>
  """
end

def link(%{patch: to} = assigns) do
  opts = assigns |> assigns_to_attributes() |> Keyword.put(:to, to)
  assigns = assign(assigns, :opts, opts)

  ~H"""
  <%= live_patch @opts do %><%= render_slot(@inner_block) %><% end %>
  """
end

def link(%{} = assigns) do
  opts = assigns |> assigns_to_attributes() |> Keyword.put(:to, assigns[:href] || "#")
  assigns = assign(assigns, :opts, opts)

  ~H"""
  <%= Phoenix.HTML.Link.link @opts do %><%= render_slot(@inner_block) %><% end %>
  """
end

@doc """
Returns a button triggered dropdown with aria keyboard and focus supporrt.

Accepts the follow slots:

  * `:id` - The id to uniquely identify this dropdown
  * `:img` - The optional img to show beside the button title
  * `:title` - The button title
  * `:subtitle` - The button subtitle

## Examples

    <.dropdown id={@id}>
      <:img src={@current_user.avatar_url}/>
      <:title><%= @current_user.name %></:title>
      <:subtitle>@<%= @current_user.username %></:subtitle>

      <:link navigate={profile_path(@current_user)}>View Profile</:link>
      <:link navigate={Routes.settings_path(LiveBeatsWeb.Endpoint, :edit)}Settings</:link>
    </.dropdown>
"""
def dropdown(assigns) do
  assigns =
    assigns
    |> assign_new(:img, fn -> nil end)
    |> assign_new(:title, fn -> nil end)
    |> assign_new(:subtitle, fn -> nil end)

  ~H"""
  <!-- User account dropdown -->
  <div class="px-3 mt-6 relative inline-block text-left">
    <div>
      <button
        id={@id}
        type="button"
        class="group w-full bg-gray-100 rounded-md px-3.5 py-2 text-sm text-left font-medium text-gray-700 hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-100 focus:ring-purple-500"
        phx-click={show_dropdown("##{@id}-dropdown")}
        phx-hook="Menu"
        data-active-class="bg-gray-100"
        aria-haspopup="true"
      >
        <span class="flex w-full justify-between items-center">
          <span class="flex min-w-0 items-center justify-between space-x-3">
            <%= for img <- @img do %>
              <img class="w-10 h-10 bg-gray-300 rounded-full flex-shrink-0" alt="" {assigns_to_attributes(img)}/>
            <% end %>
            <span class="flex-1 flex flex-col min-w-0">
              <span class="text-gray-900 text-sm font-medium truncate"><%= render_slot(@title) %></span>
              <span class="text-gray-500 text-sm truncate"><%= render_slot(@subtitle) %></span>
            </span>
          </span>
          <svg class="flex-shrink-0 h-5 w-5 text-gray-400 group-hover:text-gray-500"
            xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
            fill="currentColor" aria-hidden="true">
            <path fill-rule="evenodd"
              d="M10 3a1 1 0 01.707.293l3 3a1 1 0 01-1.414 1.414L10 5.414 7.707 7.707a1 1 0 01-1.414-1.414l3-3A1 1 0 0110 3zm-3.707 9.293a1 1 0 011.414 0L10 14.586l2.293-2.293a1 1 0 011.414 1.414l-3 3a1 1 0 01-1.414 0l-3-3a1 1 0 010-1.414z"
              clip-rule="evenodd"></path>
          </svg>
        </span>
      </button>
    </div>
    <div
      id={"#{@id}-dropdown"}
      phx-click-away={hide_dropdown("##{@id}-dropdown")}
      class="hidden z-10 mx-3 origin-top absolute right-0 left-0 mt-1 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 divide-y divide-gray-200"
      role="menu"
      aria-labelledby={@id}
    >
      <div class="py-1" role="none">
        <%= for link <- @link do %>
          <.link
            tabindex="-1"
            role="menuitem"
            class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-100 focus:ring-purple-500" {link}
          ><%= render_slot(link) %></.link>
        <% end %>
      </div>
    </div>
  </div>
  """
end
