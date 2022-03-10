# test auth with liveview

Thanks to gen.auth code

```
  setup %{conn: conn} do
    conn =
      conn
      |> Map.replace!(:secret_key_base, IfemWeb.Endpoint.config(:secret_key_base))
      |> init_test_session(%{})

    %{user: user_fixture(), admin: user_fixture(%{role: "admin"}), conn: conn}
  end

  test "access admin page", %{conn: conn, admin: admin} do
    user_token = Accounts.generate_user_session_token(admin)

    conn =
      conn
      |> put_session(:user_token, user_token)
      |> put_req_cookie(@remember_me_cookie, user_token)
      |> fetch_cookies()

    {:ok, _index_live, html} = live(conn, Routes.content_admin_path(conn, :index))

    assert html =~ "aze"
  end
```
