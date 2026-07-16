

const handleRegister = ((req , res, database, bcrypt) => {
    const { name, email, password} = req.body
    if(!name || !email || !password){
      return  res.status(400).json('Please fill out all fields.')
    }
const hash = bcrypt.hashSync(password);

database.transaction(trx => {
    trx.insert({
        hash:hash,
        email: email
    }).into('login')
    .returning('email')
    .then(loginEmail => {
        return trx('users').returning("*").insert({
    name: name, 
     email: loginEmail[0].email,
     joined: new Date()
     }).then(user => {
        res.json(user[0])
     })
    })
    .then(trx.commit)
    .catch(err => res.status(400).json('User already exists.'))
})
.catch(error => {
        res.status(400).json("Username of password is incorrect.")
     })
})

module.exports = {
    handleRegister: handleRegister,
}