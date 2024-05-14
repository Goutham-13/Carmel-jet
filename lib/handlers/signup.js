module.exports = async function (req, res) {
    try {
        const userObj = req.body.user;
        // Add the object to the 'users' collection
        db.collection('users').add(userObj)
            .then((docRef) => {
                console.log("Document written with ID: ", docRef.id);
                res.json({status : 'sucess'});
            })
            .catch((error) => {
                console.error("Error adding document: ", error);
                res.json({status : 'failed'});
            });
    } catch (error) {
        res.json({status : 'failed'});
    }
}