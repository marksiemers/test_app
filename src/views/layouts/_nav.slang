- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- if (current_user = context.current_user)
  a.nav-item.pull-right href="/signout"
    | Sign Out
  - active = context.request.path == "/profile" ? "active" : ""
  a class="nav-item #{active} pull-right" href="/profile"
    == current_user.email
- else
  - active = context.request.path == "/signup" ? "active" : ""
  a class="nav-item #{active} pull-right" href="/signup"
    | Sign Up
  - active = context.request.path == "/signin" ? "active" : ""
  a class="nav-item #{active} pull-right" href="/signin"
    | Sign In
- active = context.request.path == "/animals" ? "active" : ""
a class="nav-item #{active}" href="/animals" Animals
- active = context.request.path == "/posts" ? "active" : ""
a class="nav-item #{active}" href="/posts" Posts
- active = context.request.path == "/post_comments" ? "active" : ""
a class="nav-item #{active}" href="/post_comments" Post Comments
