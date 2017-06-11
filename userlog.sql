select fname from member
inner join userlog on member.Id=userlog.mid where loan=0