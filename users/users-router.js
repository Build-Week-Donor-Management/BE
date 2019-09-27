const router = require('express').Router();
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const cors = require('cors');
const db = require('../database/dbConfig.js');

const Users = require('../users/users-model.js');
const secrets = require('../config/secrets.js'); //<<<<<<<
const jwt_decode = require('jwt-decode');
const authenticate = require('../auth/authenticate-middleware.js');

// const mysql = require('mysql')


// const connection = mysql.createConnection({
//   host: 'propertyfastorg.powwebmysql.com',
//   user: 'propertyfastorg',
//   password: 'Home9441*',
//   database: 'donation_management'
// }
// )

// connection.connect(function(err) {
//   if (err) throw err
//   console.log('You are now connected...')
// })
// const nodemailer = require('nodemailer');

// const transporter = nodemailer.createTransport({
//   host: 'smtp.aol.com',
//   port: 465,
//   security:	'STARTTLS',
//   secure: true, // true for 465, false for other ports
// auth: {
//     user: 'scottrenz@aol.com',
//     pass: 'virg9441'
//   }
// });


// let transport = nodemailer.createTransport({
//   host: 'smtp.mailtrap.io',
//   port: 2525,
//   auth: {
//      user: 'put_your_username_here',
//      pass: 'put_your_password_here'
//   }
// });


// const mailOptions = {
//   from: 'candidateplacement@gmail.com',
//   to: 'scott_renz@yahoo.com',
//   subject: 'Sending Email using Node.js',
//   text: 'That was easy!'
// };

// transporter.sendMail(mailOptions, function(error, info){
//   if (error) {
//     console.log(error);
//   } el
//     console.log('Email sent: ' + info.response);
//   }
// }); 

let token = '';
// async function doit () {


// await Users.add('campaign',{ "name":"Save the Whales","description":"Stop people from killing whales","goal":1000000 });
// await Users.add('campaign',{ "name":"Feed the Children","description":"Help starving children","goal":50000 });
// await Users.add('campaign',{ "name":"Stop Insomnia","description":"Help people sleep","goal":60000 });

// }

// doit()

router.get('/',(req,res) => {
    Users.find('route')
      .then(user => {
  // console.log('get route',user)
        res.status(200).json(user);
      })
      .catch(error => {
        res.status(500).json(error+'');
      });
  });
  router.get('/member/user',authenticate,(req,res) => {

// Get saved data from sessionStorage
      Users.find('usermember')
        .then(user => {
    // console.log('get user',user)
          res.status(200).json(user);
        })
        .catch(error => {
          res.status(500).json(error+'');
        });
    });

  router.get('/member/board',authenticate,(req,res) => {
    Users.find('boardmember')
      .then(user => {
  // console.log('get user',user)
        res.status(200).json(user);
      })
      .catch(error => {
        res.status(500).json(error+'');
      });
  });
  
  router.get('/member/campaign',authenticate,(req,res) => {
    Users.find('campaignmember')
      .then(user => {
  // console.log('get user',user)
        res.status(200).json(user);
      })
      .catch(error => {
        res.status(500).json(error+'');
      });
  });
  
  router.get('/campaign',authenticate,(req,res) => {
    Users.find('campaign')
      .then(user => {
  // console.log('get user',user)
        res.status(200).json(user);
      })
      .catch(error => {
        res.status(500).json(error+'');
      });
  });

  router.get('/member',authenticate,authenticate,(req,res) => {
    console.log('enter get member')
    const decoded = jwt_decode(req.headers.authorization);

     console.log('member user',decoded)
    Users.find('member')
      .then(user => {
  // console.log('get user',user)
        res.status(200).json(user);
      })
      .catch(error => {
        res.status(500).json(error+'');
      });
  });
  
  router.get('/donor',authenticate,(req,res) => {
    Users.find('donor')
      .then(user => {
  // console.log('get user',user)
        res.status(200).json(user);
      })
      .catch(error => {
        res.status(500).json(error+'');
      });
  });
  
  router.get('/donation',authenticate,(req,res) => {
    Users.find('donation')
      .then(user => {
  // console.log('get user',user)
        res.status(200).json(user);
      })
      .catch(error => {
        res.status(500).json(error+'');
      });
  });
  
  router.get('/campaign/donation',authenticate,(req,res) => {
    Users.find('campaigndonation')
      .then(user => {
  // console.log('get user',user)
        res.status(200).json(user);
      })
      .catch(error => {
        res.status(500).json(error+'');
      });
  });
  
  router.get('/campaign/donate',authenticate,(req,res) => {
    Users.find('campdonate')
      .then(user => {
  // console.log('get user',user)
        res.status(200).json(user);
      })
      .catch(error => {
        res.status(500).json(error+'');
      });
  });
  
  router.get('/campaign/donor',authenticate,(req,res) => {
    Users.find('campaigndonor')
      .then(user => {
  // console.log('get user',user)
        res.status(200).json(user);
      })
      .catch(error => {
        res.status(500).json(error+'');
      });
  });
  
  router.get('/camp/donor',authenticate,(req,res) => {
    Users.find('campdonor')
      .then(user => {
  // console.log('get user',user)
        res.status(200).json(user);
      })
      .catch(error => {
        res.status(500).json(error+'');
      });
  });

  router.get('/camp/don',authenticate,(req,res) => {
    Users.find('campdons')
      .then(user => {
  // console.log('get user',user)
        res.status(200).json(user);
      })
      .catch(error => {
        res.status(500).json(error+'');
      });
  });

  router.delete('/member/:id',authenticate,(req,res) => {
    let id = req.params.id;
   // console.log('id',id)
    Users.remove('member',id)
      .then(removed => {
          res.status(200).json(removed); 
      })
      .catch(error => {
        res.status(500).json(error+'');
      });
  });
  
  router.put('/member/:id',authenticate,(req,res) => {
    console.log('id',req.params.id)
     Users.update('member',req.params.id,req.body)
       .then(updated => {
           res.status(201).json(updated); 
       })
       .catch(error => {
         res.status(500).json(error+'');
       });
   });

   function deleteRoute (req,res,table,type) {
    const decoded = jwt_decode(req.headers.authorization);
    const username = decoded.username
    console.log(table,'going to see if authorized',username)
    db.raw(`select count(username) as countit from member where type='${type}' and username ='${username}'`)
      .then(result => {
        console.log('result',result[0].countit)
        if(!result[0].countit)
        res.status(401).json('not authorized');
else {
  Users.remove(table,req.params.id)
  .then(removed => {
      res.status(200).json(removed);
    })
        .catch(error => {
          res.status(500).json(error+'');
        });
      }
       })
      .catch(error => {
        res.status(500).json(error+'');
      });
  }

  function putRoute (req,res,table,type) {
    const decoded = jwt_decode(req.headers.authorization);
    const username = decoded.username
    console.log(table,'going to see if authorized',username)
    db.raw(`select count(username) as countit from member where type='${type}' and username ='${username}'`)
      .then(result => {
        console.log('result',result[0].countit)
        if(!result[0].countit)
        res.status(401).json('not authorized');
else {
        Users.update(table,req.params.id,req.body)
        .then(updated => {
            res.status(201).json('updated '+updated); 
        })
        .catch(error => {
          res.status(500).json(error+'');
        });
      }
       })
      .catch(error => {
        res.status(500).json(error+'');
      });
  }

 function postRoute (req,res,table,type) {
     const decoded = jwt_decode(req.headers.authorization);
     const username = decoded.username
     console.log(table,'going to see if authorized',username)
     db.raw(`select count(username) as countit from member where type='${type}' and username ='${username}'`)
       .then(result => {
         console.log('result',result[0].countit)
         if(!result[0].countit)
         res.status(401).json('not authorized');
 else {
  Users.add(table,req.body)
  .then(updated => {
      res.status(201).json(updated); 
  })
  .catch(error => {
    res.status(500).json(error+'');
  });
  }
        })
       .catch(error => {
         res.status(500).json(error+'');
       });
   }
 
   router.delete('/campaign/:id',authenticate,(req,res) => deleteRoute(req, res, 'campaign','campaign'))
   router.delete('/campaign/donation/:id',authenticate,(req,res) => postRoute(req, res, 'campaigndonation','user'))
   router.delete('/donation/:id',authenticate,(req,res) => deleteRoute(req, res, 'donation','user'))
   router.delete('/donor/:id',authenticate,(req,res) => deleteRoute(req, res, 'donor','user'))
   router.put('/campaign/:id',authenticate,(req,res) => putRoute(req, res, 'campaign','campaign'))
   router.put('/campaign/donation/:id',authenticate,(req,res) => postRoute(req, res, 'campaigndonation','user'))
   router.put('/donation/:id',authenticate,(req,res) => putRoute(req, res, 'donation','user'))
   router.put('/donor/:id',authenticate,(req,res) => putRoute(req, res, 'donor','user'))
   router.post('/campaign',authenticate,(req,res) => postRoute(req, res, 'campaign','campaign'))
   router.post('/campaign/donation',authenticate,(req,res) => postRoute(req, res, 'campaigndonation','user'))
   router.post('/donation',authenticate,(req,res) => postRoute(req, res, 'donation','user'))
   router.post('/donor',authenticate,(req,res) => postRoute(req, res, 'donor','user'))

   router.post('/register/user' ,(req, res) => {
    // console.log('req',req.body)
    let user = req.body;
    const hash = bcrypt.hashSync(user.password, 10); // 2 ^ n
    user.password = hash;
    user.type = 'user'
  console.log('register user',user)
    Users.add('member',user)
      .then(saved => {
  console.log('saved',saved)
        token =generateToken(user)
        saved.token=token
        // res.status(201).json(saved).json(token);
        res.status(201).json(saved);
      })
      .catch(error => {
        res.status(500).json(error+'');
      });
  });

  router.post('/register/board', (req, res) => {
    // console.log('req',req.body)
    let user = req.body;
    const hash = bcrypt.hashSync(user.password, 10); // 2 ^ n
    user.password = hash;
    user.type = 'board'
  // console.log('register board',user)
    Users.add('member',user)
      .then(saved => {
  // console.log('saved',saved)
        token =generateToken(user)
        saved.token=token
        res.status(201).json(saved);
      })
      .catch(error => {
        res.status(500).json(error+'');
      });
  });

  router.post('/register/campaign', (req, res) => {
    // console.log('req',req.body)
    let user = req.body;
    const hash = bcrypt.hashSync(user.password, 10); // 2 ^ n
    user.password = hash;
    user.type = 'campaign'
  // console.log('register campaign',user)
    Users.add('member',user)
      .then(saved => {
  // console.log('saved',saved)
        token =generateToken(user)
        saved.token=token
        res.status(201).json(saved);
      })
      .catch(error => {
        res.status(500).json(error+'');
      });
  });
      
router.post('/login', (req, res) => {
  let { username, password } = req.body;
  console.log('login username',username)
    Users.findBy('member',{ username })
    .first()
    .then(user => {
// console.log('login user',user.id)
      if (user && bcrypt.compareSync(password, user.password)) {
        token = generateToken(user);
        user.token = token
        const decoded = jwt_decode(token);
  res.status(200).json(user);

console.log('post login decoded token',decoded)
// return res.json({token: jwt.sign({ email: user.email, fullName: user.fullName, _id: user._id}, 'RESTFULAPIs')});        res.status(200).json({ token });
      } else {
        res.status(401).json({ message: 'Invalid Credentials' });
      }
    })
    .catch(error => {
      res.status(500).json(error+'');
    });
});

function generateToken(user) {
  const payload = {
    username: user.username
    };
  const options = {
    expiresIn: '1d',
  };
  // bring in the secret from the secrets file
  return jwt.sign(payload, secrets.jwtSecret, options);
}

module.exports = router;

