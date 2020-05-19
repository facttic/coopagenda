alias Coopagenda.Accounts
alias Coopagenda.Agenda

{:ok, user1} =
  Accounts.create_user(%{
    admin: true,
    username: "peter",
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

# slot1
{:ok, proposal1} =
  Agenda.create_proposal(user1, %{
    accepted: false,
    details: "some details",
    hosted_by: "Mariana Alles",
    hosting_coop: "hosting_coop",
    title: "Marvelous adventure"
  })

# slot1
{:ok, proposal2} =
  Agenda.create_proposal(user1, %{
    accepted: false,
    details: "some more details",
    hosted_by: "Milton Cotsco",
    hosting_coop: "another_hosting_coop",
    title: "Fantastic honey"
  })

# slot2
{:ok, proposal3} =
  Agenda.create_proposal(user1, %{
    accepted: false,
    details: "the details for my fabilot proposal",
    hosted_by: "Gunther Carioca",
    hosting_coop: "the first_hosting_coop",
    title: "Curso de marionetas"
  })

# Second user's structure to test access
{:ok, user2} =
  Accounts.create_user(%{
    admin: true,
    username: "juanca",
    avatar: "some other avatar",
    email: "oromoro@gmail.net",
    provider: "swifthub"
  })

Agenda.create_slot(user2, %{
  begin: "2020-05-01T15:00:00Z",
  duration: 60
})

# slot2
{:ok, proposal4} =
  Agenda.create_proposal(user2, %{
    accepted: false,
    details: "details for the slot created by another user",
    hosted_by: "Paralelo gramo",
    hosting_coop: "another_hosting_coop",
    title: "Fustko Moruno"
  })

{:ok, proposal5} =
  Agenda.create_proposal(user2, %{
    accepted: false,
    details: "My proposal is for a good talk chit chat",
    hosted_by: "Miriam Carenina",
    hosting_coop: "another_posting_coop",
    title: "Rock and roll y fieber"
  })

Accounts.create_user(%{
  admin: false,
  username: "notfalse",
  avatar: "not an admins avatar",
  email: "kristiankamaro@gmail.net",
  provider: "covid19hub"
})

Agenda.upsert_slot_proposals(slot1, [proposal1.id, proposal2.id])
Agenda.upsert_slot_proposals(slot2, [proposal4.id, proposal3.id, proposal5.id])
