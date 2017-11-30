h1 Show Animal
p = animal.name
p = animal.body
p = animal.published
p
  == link_to("back", "/animals", class: "btn btn-success btn-xs")
  == link_to("edit", "/animals/#{animal.id}/edit", class: "btn btn-success btn-xs")
  == link_to("delete", "/animals/#{animal.id}?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
