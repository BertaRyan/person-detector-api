const express = require('express')
const bcrypt = require('bcrypt-nodejs')
const cors = require('cors')
const knex = require('knex')

const database = knex({
  client: 'pg',
  connection: {
    host: '127.0.0.1',
    user: 'postgres',
    password: 'Jesus',
    database: 'smart-brain',
  },
});

const app = express()
app.use(express.json())
app.use(express.urlencoded({extended: true, depth: 5})) // for nested object protection
app.use(cors())

const register = require('./controllers/register')
const signin = require('./controllers/signin')
const profile = require('./controllers/profile')
const image = require('./controllers/image')




app.get('/', (req, res) => {
    res.send("Successfully retrieved the Users")
})

app.post("/signin", (req , res) => { signin.handleSignin(req, res, database, bcrypt)})


app.post("/register",(req , res) => { register.handleRegister(req,res, database, bcrypt)})

app.get('/profile/:id', (req, res) => { profile.handleGetProfile(req, res, database) })

app.put("/image", (req, res) => {image.handleImage(req, res, database)})

app.post('/post-image', (req, res) => {
  const { imgInputValue } = req.body;

  let contentType;

  fetch(imgInputValue)
    .then((response) => {
      contentType = response.headers.get("content-type");

      return response.blob();
    })
    .then((imageBlob) => {
      return fetch(
        "https://router.huggingface.co/hf-inference/models/facebook/detr-resnet-50",
        {
          method: "POST",
          headers: {
            Authorization: `Bearer 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`,
            "Content-Type": contentType,
          },
          body: imageBlob,
        }
      );
    })
    .then((apiResponse) => apiResponse.json())
    .then((result) => {
      console.log(result);
      res.json(result);
    })
    .catch((err) => {
      console.log(err);
      res.status(400).json("Image Detection Failed.");
    });
});

// app.post('/post-image', async(req, res) => {
//     try{
//             const {imgInputValue} = req.body

//             console.log(typeof imgInputValue)
    
//     const response =  await fetch(imgInputValue);
//     const imageBlob = await response.blob();
//     const contentType = response.headers.get("content-type");

//     const apiResponse = await fetch(
//       "https://router.huggingface.co/hf-inference/models/facebook/detr-resnet-50",
//       {
//         method: "POST",
//         headers: {
//           Authorization: `Bearer ${process.env.HUG_KEY}`,
//           "Content-Type": contentType,
//         },
//         body: imageBlob,
//       }
//     );
      

//     const result = await apiResponse.json(); // try to experiment and see what the image detects!
//     console.log(result)
//     res.json(result)

//     } catch(err) {
//     console.log(err)
//     res.status(400).json('Image Detection Failed.')
//     }
  
// })

app.listen(3000, () => {
console.log("app is running smoothly")
})




// bcrypt.compare("veggies", hash, function(err, res) {
//     // res = false
// });

/* 
API PLAN OF ATTACK

/ -> res => this is working

/signin -> Post success/fail (Hide password from being accessed)

/register -> Post success/fail

/profile/:userId -> Get = user

/profile/:userId -> Put = imageCounter variable in user

*/