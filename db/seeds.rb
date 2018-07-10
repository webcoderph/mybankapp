# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
no = "00000001"
client = Client.create(first_name: "maynard", last_name: "cabalitan", middle_name: "tria", client_no: no)
BankAccount.create(client: client, account_no: no)

