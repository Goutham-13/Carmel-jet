const db = require("../firebase");

module.exports = async function (req,res) {
    const {id, medinfo} = req.body;
    try {
        // Query the 'users' collection to find the document with matching 'id' field
        const querySnapshot = await db.collection('users').where('id', '==', id).get();
    
        if (querySnapshot.empty) {
          console.log('No user found with the specified user ID');
          res.json({status : 'failed'});
          return;
        }
    
        // Assuming there's only one document with the given id
        const userDoc = querySnapshot.docs[0];
    
        // Update the 'med-info' field of the found document
        await userDoc.ref.update({ 'med-info': medinfo });
        console.log(`Med info updated for user with ID ${id}`);
        res.json({status : 'sucess'});
      } catch (error) {
        console.error('Error updating med info:', error);
        res.json({status : 'failed'});

      }
}