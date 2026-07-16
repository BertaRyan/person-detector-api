

const handleImage = ((req, res, database) => {
     const {id} = req.body
    database.from('users').where("id", "=", id).increment("entries", 1).returning('entries').then(user => {
      res.json(user[0])
    })
})


module.exports = {
    handleImage: handleImage,
    
}