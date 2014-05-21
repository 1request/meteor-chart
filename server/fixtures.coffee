if Activities.find().count() is 0

  activities = [
    {
      "__v": 0,
      "time": "2014-05-14T13:57:13.484Z",
      "beaconId": "312",
      "strength": "0.5",
      "username": "harryng"
    },
    {
      "__v": 0,
      "time": "2014-05-14T15:20:12.567Z",
      "beaconId": "312",
      "strength": "100",
      "username": "harryng"
    },
    {
      "__v": 0,
      "time": "2014-05-14T15:20:25.644Z",
      "beaconId": "312",
      "strength": "20",
      "username": "harryng"
    },
    {
      "__v": 0,
      "time": "2014-05-15T02:47:28.614Z",
      "beaconId": "312",
      "strength": "100",
      "username": "harryng"
    },
    {
      "__v": 0,
      "time": "2014-05-15T02:49:15.612Z",
      "beaconId": "312",
      "strength": "1000",
      "username": "harryng"
    },
    {
      "__v": 0,
      "time": "2014-05-15T02:55:22.252Z",
      "beaconId": "312",
      "strength": "1000",
      "username": "harryng"
    },
    {
      "__v": 0,
      "time": "2014-05-15T02:55:41.716Z",
      "beaconId": "312",
      "strength": "1000",
      "username": "harryng"
    },
    {
      "__v": 0,
      "time": "2014-05-15T04:04:53.402Z",
      "beaconId": "312",
      "strength": "400",
      "username": "harryng"
    },
    {
      "__v": 0,
      "time": "2014-05-15T09:40:32.652Z",
      "beaconId": "312",
      "strength": "1000",
      "username": "harryng"
    },
    {
      "__v": 0,
      "time": "2014-05-21T09:12:24.173Z",
      "beaconId": "312",
      "strength": "1000",
      "username": "harryng"
    }
  ]

  for activity in activities
    Activities.insert activity