- if post.errors
  ul.errors
  - post.errors.each do |error|
    li = error.to_s

== form(action: "/posts/#{post.id.to_s}", method: post.id ? :patch : :post) do
  == csrf_tag
  div.form-group
    == label(:user)
    == select_field(name: "user_id", collection: User.all.map{|user| [user.id, user.id]}, selected: post.user_id, class: "form-control")
  div.form-group
  == text_field(name: "name", value: post.name, placeholder: "Name", class: "form-control")
  div.form-group
  == text_area(name: "body", content: post.body, placeholder: "Body", class: "form-control", size: "30x10")
  div.form-group
  == text_field(name: "age", value: post.age, placeholder: "Age", class: "form-control")
  div.form-group
  div.checkbox
    == label(:published)
    == check_box(:published, checked: post.published.to_s == "1")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/posts", class: "btn btn-default btn-xs")
