
// keeping a pointer to the session is very useful!
var session;
var name;
try {
  QiSession( function (s) {
    console.log('connected!');
    session = s;
    // now that we are connected, we can use the buttons on the page
    s.service('ALMemory').then(function (memory) {
      memory.subscriber('TouchChanged').then(function (subscriber) {
        subscriber.signal.connect(registration);
      });
    });
  });
} catch (err) {
  console.log("Error when initializing QiSession: " + err.message);
  console.log("Make sure you load this page from the robots server.")
}

$(function () {
  $('#ok').click(storage);
  
});

function storage() {
   session.service('ALMemory').then(function (memory) {
    memory.insertData("GamerName",name);
  }, function (error) {
    console.log(error);
  })

}


function registration() {
    name = prompt("Please enter your name", "YourName");
}

