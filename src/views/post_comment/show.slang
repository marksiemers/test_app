h1 Show Post Comment
p = post_comment.user.id
p = post_comment.name
p = post_comment.body
p = post_comment.age
p = post_comment.published
p = post_comment.post.id
p
  == link_to("back", "/post_comments", class: "btn btn-success btn-xs")
  == link_to("edit", "/post_comments/#{post_comment.id}/edit", class: "btn btn-success btn-xs")
  == link_to("delete", "/post_comments/#{post_comment.id}?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
