handleGameTitle = (userId, doc) ->
  gameDoc = Mpf.Collections.games.findOne
    title: doc.title
  ,
    _id: true
    platforms: true
    unverifiedPlatforms: true

  if gameDoc?
    doc.gameId = gameDoc._id
    if (doc.platform !in gameDoc.platforms and
        doc.platform !in gameDoc.unverifiedPlatforms)
      Mpf.Collections.games.update gameDoc._id,
        $push:
          unverifiedPlatforms: doc.platform

  else
    Mpf.Collections.games.insert
      title: doc.title
      unverifiedPlatforms: [doc.platform]
      verified: false
    Mpf.Games.lookupAndUpdateDatabase(doc.title)



Mpf.Collections.inventory.before.insert handleGameTitle
Mpf.Collections.wishlist.before.insert handleGameTitle
