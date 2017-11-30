div.row
  div.col-sm-11
    h2 Animals
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/animals/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Body
        th Published
        th Actions
    tbody
    - animals.each do |animal|
      tr
        td = animal.name
        td = animal.body
        td = animal.published
        td
          span
            == link_to("read", "/animals/#{animal.id}", class: "btn btn-success btn-xs")
            == link_to("edit", "/animals/#{animal.id}/edit", class: "btn btn-success btn-xs")
            == link_to("delete", "/animals/#{ animal.id }?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
