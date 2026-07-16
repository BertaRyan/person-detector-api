
const handleSignin = ((req , res, database, bcrypt) => {
const {email, password} = req.body;
database.select('email', 'hash').from('login').where('email', "=", req.body.email)
.then(data => {
   const isValid = bcrypt.compareSync(req.body.password, data[0].hash)

  if(isValid){
   return database.select('email', 'hash').from('login')
    .where('email', "=", req.body.email)
    .then(user => {
         database.select('*').from('users').where('email', "=", user[0].email).then(data => {
           res.json(data[0])
        })
        
    })
    .catch(err => res.status(400).json('Incorrect username or password. Please try again.'))
  } else{
    res.status(400).json('Incorrect username or password. Please try again.')
  }

}).catch(err => {
    res.status(400).json('Incorrect username or password. Please try again.')
})

})

module.exports = {
    handleSignin: handleSignin,
}