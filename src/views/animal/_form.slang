- if animal.errors
  ul.errors
  - animal.errors.each do |error|
    li = error.to_s

== form(action: "/animals/#{animal.id.to_s}", method: animal.id ? :patch : :post) do
  == csrf_tag
  div.form-group
  == text_field(name: "name", value: animal.name, placeholder: "Name", class: "form-control")
  div.form-group
  == text_area(name: "body", content: animal.body, placeholder: "Body", class: "form-control", size: "30x10")
  div.form-group
  div.checkbox
    == label(:published)
    == check_box(:published, checked: animal.published.to_s == "1")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/animals", class: "btn btn-default btn-xs")
