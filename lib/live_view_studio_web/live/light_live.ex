defmodule LiveViewStudioWeb.LightLive do
  use LiveViewStudioWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, brightness: 10)
    {:ok, socket}
  end

  def handle_event("on", _payload, socket) do
    {:noreply, socket |> assign(:brightness, 100)}
  end

  def handle_event("off", _payload, socket) do
    {:noreply, socket |> assign(:brightness, 0)}
  end

  # Use `update` to update an assigned value in place
  # Takes a socket, key, and lambda
  def handle_event("less", _payload, socket) do
    {:noreply, socket |> update(:brightness, &(&1 - 10))}
  end

  def handle_event("more", _payload, socket) do
    {:noreply, socket |> update(:brightness, &(&1 + 10))}
  end

  def render(assigns) do
    ~H"""
    <h1>Interactive light switch</h1>

    <div id="light">
      <div class="meter">
        <span style={"width: #{@brightness}%"}>
          <%= @brightness %>
        </span>
      </div>
      
      <button phx-click="off">
        <img src="/images/light-off.svg" />
      </button>
      
      <button phx-click="less">
        <img src="/images/down.svg" />
      </button>
      
      <button phx-click="more">
        <img src="/images/up.svg" />
      </button>
      
      <button phx-click="on">
        <img src="/images/light-on.svg" />
      </button>
    </div>
    """
  end
end
