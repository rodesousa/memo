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
