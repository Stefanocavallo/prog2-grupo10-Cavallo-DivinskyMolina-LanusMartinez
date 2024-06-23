var express = require('express');
var router = express.Router();

let profileController = require('../controllers/profileController');

router.get('/login', profileController.login);

router.get('/register', profileController.register);

router.get('/usuario/:usuario', profileController.profile);

router.get('/profileEdit', profileController.edit);

module.exports = router;