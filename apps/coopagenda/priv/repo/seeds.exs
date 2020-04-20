alias Coopagenda.Accounts
alias Coopagenda.Agenda

{:ok, user1} =
  Accounts.create_user(%{
    admin: true,
    avatar: "some avatar",
    email: "uriburu@gmail.net",
    provider: "builthub"
  })

{:ok, slot1} =
  Agenda.create_slot(user1, %{
    begin: "2020-04-25T14:00:00Z",
    duration: 42
  })

{:ok, slot2} =
  Agenda.create_slot(user1, %{
    begin: "2020-04-26T14:00:00Z",
    duration: 60
  })

Agenda.create_slot(user1, %{
  begin: "2020-04-27T14:00:00Z",
  duration: 90
})

Agenda.create_proposal(slot1, user1.id, %{
  accepted: false,
  details: "some details",
  hosted_by: "Mariano Nanos",
  hosting_coop: "hosting_coop",
  title: "Marvelous adventure"
})

Agenda.create_proposal(slot1, user1.id, %{
  accepted: false,
  details: "some more details",
  hosted_by: "Milton Cotsco",
  hosting_coop: "another_hosting_coop",
  title: "Fantastic honey"
})

Agenda.create_proposal(slot2, user1.id, %{
  accepted: false,
  details: "the details for my fibrilose proposal",
  hosted_by: "Gunther Carioca",
  hosting_coop: "the first_hosting_coop",
  title: "Curso de marionetas"
})

# Second user's structure to test access
{:ok, user2} =
  Accounts.create_user(%{
    admin: true,
    avatar: "some other avatar",
    email: "oromoro@gmail.net",
    provider: "swifthub"
  })

Agenda.create_slot(user2, %{
  begin: "2020-05-01T15:00:00Z",
  duration: 60
})

Agenda.create_proposal(slot2, user2.id, %{
  accepted: false,
  details: "details for the slot created by another user",
  hosted_by: "Paralelo gramo",
  hosting_coop: "another_hosting_coop",
  title: "Fustko Moruno"
})

Accounts.create_user(%{
  admin: false,
  avatar: "not an admins avatar",
  email: "kristiankamaro@gmail.net",
  provider: "corobuhub"
})
