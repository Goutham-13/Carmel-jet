const { status } = require("@grpc/grpc-js");
const db = require("../firebase");

module.exports = async function (req, res, io) {
  try {
    const { busno } = req.body
    // Query the 'bus' collection to find the document with matching 'busNo' field
    const querySnapshot = await db.collection('bus').where('busno', '==', busno).get();

    if (querySnapshot.empty) {
      console.log('No bus found with the specified bus number');
      res.json({ status: 'failed' });
      return;
    }

    // Assuming there's only one document with the given busNo
    const busDoc = querySnapshot.docs[0];
    const currentLoc = busDoc.data().currentloc || 0;
    const updatedLoc = currentLoc + 1;

    // Update the 'currentLoc' field of the found document
    await busDoc.ref.update({ currentloc: updatedLoc });




    //signal to all users in a bus to update currrent loc
    const notiBus = busno+2

    const snapshot = await db.collection("users").where("busno", "==", busno).get();

    const signal = { busno : busno, currentloc : updatedLoc };

    snapshot.forEach(doc => {
      const userData = doc.data();
      const userId = doc.id;
      // Emit signal to user with userId
      io.to(userId).emit(JSON.stringify(signal));
      console.log(`Signal emitted to user ${userId}`);
    });




    console.log(`Current location for bus ${busno} updated to ${updatedLoc}`);
    res.json({ status: 'sucess' });
  } catch (error) {
    console.error('Error updating current location:', error);
    res.json({ status: 'failed' });
  }
}