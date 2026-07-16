
const handleGetProfile = ((req, res, database) => {
    const {id} = req.params
   database('*').from('users').where({id: id})
   .then(user => {
    if(user.length){
        res.json(user[0])
    }else{
        res.status(400).json('Not Found.')
    }
   })
   
})

module.exports = {
    handleGetProfile:  handleGetProfile,
}